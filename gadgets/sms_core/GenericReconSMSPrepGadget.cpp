
#include "GenericReconSMSPrepGadget.h"
#include <iomanip>

#include "hoNDArray_reductions.h"
#include "mri_core_def.h"

namespace Gadgetron {

GenericReconSMSPrepGadget::GenericReconSMSPrepGadget() : BaseClass()
{
}

GenericReconSMSPrepGadget::~GenericReconSMSPrepGadget()
{
}

int GenericReconSMSPrepGadget::process_config(ACE_Message_Block* mb)
{
    GADGET_CHECK_RETURN(BaseClass::process_config(mb) == GADGET_OK, GADGET_FAIL);

    return GADGET_OK;
}

int GenericReconSMSPrepGadget::process(Gadgetron::GadgetContainerMessage< IsmrmrdReconData >* m1)
{
    if (perform_timing.value()) { gt_timer_.start("GenericReconSMSPrepGadget::process"); }

    process_called_times_++;

    IsmrmrdReconData* recon_bit_ = m1->getObjectPtr();
    if (recon_bit_->rbit_.size() > num_encoding_spaces_)
    {
        GWARN_STREAM("Incoming recon_bit has more encoding spaces than the protocol : " << recon_bit_->rbit_.size() << " instead of " << num_encoding_spaces_);
    }

    // for every encoding space, prepare the recon_bit_->rbit_[e].ref_
    size_t e, n, s, slc;
    for (e = 0; e < recon_bit_->rbit_.size(); e++)
    {
        auto & rbit = recon_bit_->rbit_[e];
        std::stringstream os;
        os << "_encoding_" << e;

        if (recon_bit_->rbit_[e].ref_)
        {
            // std::cout << " je suis la structure qui contient les données acs" << std::endl;

            hoNDArray< std::complex<float> >& data = recon_bit_->rbit_[e].ref_->data_;

            size_t RO = data.get_size(0);
            size_t E1 = data.get_size(1);
            size_t E2 = data.get_size(2);
            size_t CHA = data.get_size(3);
            size_t N = data.get_size(4);
            size_t S = data.get_size(5);
            size_t SLC = data.get_size(6);

            GDEBUG_STREAM("GenericSMSPrepGadget - incoming data array ref : [RO E1 E2 CHA N S SLC] - [" << RO << " " << E1 << " " << E2 << " " << CHA << " " << N << " " << S << " " << SLC << "]");

            ref_8D.create(RO, E1, E2, CHA, MB_factor, lNumberOfStacks_ , N, S );

            pre_process_ref_data(data, ref_8D,  e);

            recon_bit_->rbit_[e].ref_->data_ = ref_8D;

        }

        if (recon_bit_->rbit_[e].data_.data_.get_number_of_elements() > 0)
        {
            // std::cout << " je suis la structure qui contient les données single band et/ou multiband" << std::endl;

            GDEBUG("GenericSMSPrepGadget - |--------------------------------------------------------------------------|\n");

            bool is_single_band=false;

            bool is_first_repetition=detect_first_repetition(recon_bit_->rbit_[e]);

            if (is_first_repetition==true) {

                is_single_band=detect_single_band_data(recon_bit_->rbit_[e]);

                hoNDArray< std::complex<float> >& data = recon_bit_->rbit_[e].data_.data_;

                size_t RO = data.get_size(0);
                size_t E1 = data.get_size(1);
                size_t E2 = data.get_size(2);
                size_t CHA = data.get_size(3);
                size_t N = data.get_size(4);
                size_t S = data.get_size(5);
                size_t SLC = data.get_size(6);

                //TODO should be done somewhere else
                sb_8D.create(RO, E1, E2, CHA, MB_factor, lNumberOfStacks_ , N, S );
                mb_8D.create(RO, E1, E2, CHA, MB_factor, lNumberOfStacks_ , N, S );
            }

            //TODO mettre recon_bit_->rbit_[e] a la place de data + header
            hoNDArray< std::complex<float> >& data = recon_bit_->rbit_[e].data_.data_;
            hoNDArray< ISMRMRD::AcquisitionHeader > headers_ =recon_bit_->rbit_[e].data_.headers_;  //5D, fixed order [E1, E2, N, S, LOC]

            // create to new hoNDArray [8D] for the sb and mb data

            if (is_single_band==true)
            {
                define_usefull_parameters_simple_version(recon_bit_->rbit_[e], e);
                pre_process_sb_data(data, sb_8D, headers_, e);
                recon_bit_->rbit_[e].data_.data_ = sb_8D;

            }
            else
            {
                // only mb data
                //then apply standard proccesing on mb
                define_usefull_parameters_simple_version(recon_bit_->rbit_[e], e);
                pre_process_mb_data(data, mb_8D, headers_ , e);
                recon_bit_->rbit_[e].data_.data_ = mb_8D;

            }
        }
    }

    if (perform_timing.value()) { gt_timer_.stop(); }

    if (this->next()->putq(m1) < 0)
    {
        GERROR_STREAM("Put IsmrmrdReconData to Q failed ... ");
        return GADGET_FAIL;
    }

    return GADGET_OK;
}



//sur les données single band
void GenericReconSMSPrepGadget::pre_process_ref_data(hoNDArray< std::complex<float> >& ref, hoNDArray< std::complex<float> >& ref_8D, size_t e)
{
    // three steps are necessary
    // 1) to reorganize the slices in the stack of slices according the to the slice acceleration
    // 2) to apply (or not depending of the sequence implementation) a blip caipi shift along the y
    // 3) to apply the averaged epi ghost correction

    reorganize_sb_data_to_8D(ref, ref_8D, e);

    do_fft_for_ref_scan(ref_8D);

    //apply_relative_phase_shift(ref_8D, false);


}


//sur les données single band
void GenericReconSMSPrepGadget::pre_process_sb_data(hoNDArray< std::complex<float> >& sb, hoNDArray< std::complex<float> >& sb_8D, hoNDArray< ISMRMRD::AcquisitionHeader > & h_sb, size_t e)
{
    // three steps are necessary
    // 1) to reorganize the slices in the stack of slices according the to the slice acceleration
    // 2) to apply (or not depending of the sequence implementation) a blip caipi shift along the y
    // 3) to apply the averaged epi ghost correction

    reorganize_sb_data_to_8D(sb, sb_8D, e);

    apply_averaged_epi_ghost_correction(sb_8D, h_sb, e);

    apply_blip_caipi_shift(sb_8D, h_sb,  e);



}


void GenericReconSMSPrepGadget::reorganize_sb_data_to_8D(hoNDArray< std::complex<float> >& sb, hoNDArray< std::complex<float> >& sb_8D, size_t e)
{
    std::stringstream os;
    os << "_encoding_" << e;
    std::string suffix = os.str();

    if (!debug_folder_full_path_.empty())
    {
        save_7D_containers_as_4D_matrix_with_a_loop_along_the_7th_dim(sb, "FID_SB4D", os.str());
    }

    if (use_omp.value()==true)
    {
        if (perform_timing.value()) { gt_timer_local_.start("GenericReconSMSPrepGadget::create_stacks_of_slices_directly_open"); }
        create_stacks_of_slices_directly_open(sb, sb_8D, indice_sb);
        if (perform_timing.value()) { gt_timer_local_.stop(); }
    }
    else
    {
        if (perform_timing.value()) { gt_timer_local_.start("GenericReconSMSPrepGadget::create_stacks_of_slices_directly"); }
        create_stacks_of_slices_directly(sb, sb_8D, indice_sb);
        if (perform_timing.value()) { gt_timer_local_.stop(); }
    }



    if (!debug_folder_full_path_.empty())
    {
        save_8D_containers_as_4D_matrix_with_a_loop_along_the_6th_dim_stk(sb_8D, "FID_SB4D_create_stacks", os.str());
    }
}


void GenericReconSMSPrepGadget::apply_blip_caipi_shift(hoNDArray< std::complex<float> >& sb_8D, hoNDArray< ISMRMRD::AcquisitionHeader > & headers_sb, size_t e)
{
    std::stringstream os;
    os << "_encoding_" << e;
    std::string suffix = os.str();

    if (is_wip_sequence==1)
    {

        if (!debug_folder_full_path_.empty())
        {
            save_8D_containers_as_4D_matrix_with_a_loop_along_the_6th_dim_stk(sb_8D, "FID_SB4D_prep_avant_relative_shift", os.str());
        }

        // si WIP on applique le blip caipi
        if (perform_timing.value()) { gt_timer_local_.start("GenericReconSMSPrepGadget::apply_relative_phase_shift"); }
        apply_relative_phase_shift(sb_8D, false);
        if (perform_timing.value()) { gt_timer_local_.stop(); }

        if (!debug_folder_full_path_.empty())
        {
            save_8D_containers_as_4D_matrix_with_a_loop_along_the_6th_dim_stk(sb_8D, "FID_SB4D_prep_apres_relative_shift", os.str());
        }

        // et on applique aussi l'offset de phase
        // recupération de l'offset de position dans la direction de coupe
        if (perform_timing.value()) { gt_timer_local_.start("GenericReconSMSPrepGadget::get_header_and_position_and_gap"); }
        get_header_and_position_and_gap(sb_8D, headers_sb);
        if (perform_timing.value()) { gt_timer_local_.stop(); }

        if (perform_timing.value()) { gt_timer_local_.start("GenericReconSMSPrepGadget::apply_absolute_phase_shift"); }
        apply_absolute_phase_shift(sb_8D,false);
        if (perform_timing.value()) { gt_timer_local_.stop(); }

        if (!debug_folder_full_path_.empty())
        {
            save_8D_containers_as_4D_matrix_with_a_loop_along_the_6th_dim_stk(sb_8D, "FID_SB4D_prep_apres_absolute_shift", os.str());
        }

    }
    else if (is_cmrr_sequence==1 && is_wip_sequence==0)
    {
        // si CMMR on ne fait rien
    }
    else
    {
        GERROR("is_wip_sequence && is_cmrr_sequence");
    }
}


void GenericReconSMSPrepGadget::apply_averaged_epi_ghost_correction(hoNDArray< std::complex<float> >& sb_8D, hoNDArray< ISMRMRD::AcquisitionHeader > & headers_sb, size_t e)
{
    std::stringstream os;
    os << "_encoding_" << e;
    std::string suffix = os.str();

    //apply the average slice navigator
    if (perform_timing.value()) { gt_timer_local_.start("GenericReconSMSPrepGadget::load_epi_data"); }

    load_epi_data();

    if (perform_timing.value()) { gt_timer_local_.stop(); }


    //prepare epi data
    if (perform_timing.value()) { gt_timer_local_.start("GenericReconSMSPrepGadget::prepare_epi_data"); }
    prepare_epi_data(e, sb_8D.get_size(1), sb_8D.get_size(2), sb_8D.get_size(3));
    if (perform_timing.value()) { gt_timer_local_.stop(); }

    if (!debug_folder_full_path_.empty())
    {
        save_8D_containers_as_4D_matrix_with_a_loop_along_the_6th_dim_stk(sb_8D, "FID_SB_avant_epi_nav", os.str());
    }

    //hoNDArray< std::complex<float> > sb_8D_optimal=sb_8D;
    //unapply optimal correction
    //apply_ghost_correction_with_STK6(sb_8D, headers_sb ,  acceFactorSMSE1_[e], true , true);

    if (!debug_folder_full_path_.empty())
    {
        save_8D_containers_as_4D_matrix_with_a_loop_along_the_6th_dim_stk(sb_8D, "FID_SB_avant2_epi_nav", os.str());
    }


    if (perform_timing.value()) { gt_timer_local_.start("GenericReconSMSPrepGadget::apply_ghost_correction_with_STK6 SB"); }
    apply_ghost_correction_with_STK6(sb_8D, headers_sb ,  acceFactorSMSE1_[e], false , false, false, "PREP SB");
    if (perform_timing.value()) { gt_timer_local_.stop(); }

    /*if (perform_timing.value()) { gt_timer_local_.start("GenericReconSMSPrepGadget::apply_ghost_correction_with_arma_STK6 SB"); }
    apply_ghost_correction_with_arma_STK6(sb_8D, headers_sb ,  acceFactorSMSE1_[e], false , false, "PREP SB");
    if (perform_timing.value()) { gt_timer_local_.stop(); }*/


    /*  if (perform_timing.value()) { gt_timer_local_.start("GenericReconSMSPrepGadget::apply_ghost_correction_with_STK6_open SB"); }
    apply_ghost_correction_with_STK6_open(sb_8D, headers_sb ,  acceFactorSMSE1_[e], false , false, "PREP SB");
    if (perform_timing.value()) { gt_timer_local_.stop(); }
*/





    //apply_ghost_correction_with_STK6(sb_8D_optimal, headers_sb ,  acceFactorSMSE1_[e] , true);

    if (!debug_folder_full_path_.empty())
    {
        save_8D_containers_as_4D_matrix_with_a_loop_along_the_6th_dim_stk(sb_8D, "FID_SB_apres_epi_nav", os.str());
    }

    //if (!debug_folder_full_path_.empty())
    //{
    //save_8D_containers_as_4D_matrix_with_a_loop_along_the_6th_dim_stk(sb_8D_optimal, "FID_SB_optimal_apres_epi_nav", os.str());
    //}

}

void GenericReconSMSPrepGadget::pre_process_mb_data(hoNDArray< std::complex<float> >& mb, hoNDArray< std::complex<float> >& mb_8D,hoNDArray< ISMRMRD::AcquisitionHeader > & headers_mb, size_t e)
{

    std::stringstream os;
    os << "_encoding_" << e;
    std::string suffix = os.str();

    if (!debug_folder_full_path_.empty())
    {
        save_7D_containers_as_4D_matrix_with_a_loop_along_the_7th_dim(mb, "FID_MB4D", os.str());
    }


    if (use_omp.value()==true)
    {
        if (perform_timing.value()) { gt_timer_local_.start("GenericReconSMSPrepGadget::reorganize_mb_data_to_8D_open"); }
        reorganize_mb_data_to_8D_open(mb, mb_8D);
        if (perform_timing.value()) { gt_timer_local_.stop(); }
    }
    else
    {
        if (perform_timing.value()) { gt_timer_local_.start("GenericReconSMSPrepGadget::reorganize_mb_data_to_8D"); }
        reorganize_mb_data_to_8D(mb, mb_8D);
        if (perform_timing.value()) { gt_timer_local_.stop(); }
    }


    if (!debug_folder_full_path_.empty())
    {
        save_8D_containers_as_4D_matrix_with_a_loop_along_the_6th_dim_stk(mb_8D, "FID_MB4D_remove", os.str());
    }

    //apply the average slice navigator
    if (!debug_folder_full_path_.empty())
    {
        save_8D_containers_as_4D_matrix_with_a_loop_along_the_6th_dim_stk(mb_8D, "FID_MB_avant_epi_nav", os.str());
    }

    /*    if (perform_timing.value()) { gt_timer_local_.start("GenericReconSMSPrepGadget::apply_ghost_correction_with_arma_STK6 MB"); }
    apply_ghost_correction_with_arma_STK6(mb_8D, headers_mb ,  acceFactorSMSE1_[e], false , false , " Prep MB ");
    if (perform_timing.value()) { gt_timer_local_.stop(); }
    */

    if (perform_timing.value()) { gt_timer_local_.start("GenericReconSMSPrepGadget::apply_ghost_correction_with_STK6 MB"); }
    apply_ghost_correction_with_STK6(mb_8D, headers_mb ,  acceFactorSMSE1_[e], false , false , false, " Prep MB ");
    if (perform_timing.value()) { gt_timer_local_.stop(); }

    /*  if (perform_timing.value()) { gt_timer_local_.start("GenericReconSMSPrepGadget::apply_ghost_correction_with_STK6 open MB"); }
    apply_ghost_correction_with_STK6_open(mb_8D, headers_mb ,  acceFactorSMSE1_[e], false , false , " Prep MB ");
    if (perform_timing.value()) { gt_timer_local_.stop(); }*/

    if (!debug_folder_full_path_.empty())
    {
        save_8D_containers_as_4D_matrix_with_a_loop_along_the_6th_dim_stk(mb_8D, "FID_MB_apres_epi_nav", os.str());
    }

}

void GenericReconSMSPrepGadget::reorganize_mb_data_to_8D_open(hoNDArray< std::complex<float> >& mb,hoNDArray< std::complex<float> >& mb_8D )
{
    size_t RO=mb.get_size(0);
    size_t E1=mb.get_size(1);
    size_t E2=mb.get_size(2);
    size_t CHA=mb.get_size(3);
    size_t N=mb.get_size(4);
    size_t S=mb.get_size(5);
    size_t SLC=mb.get_size(6);

    long long num = N * S * lNumberOfStacks_;
    long long ii;

    // only allow this for loop openmp if num>1 and 2D recon
#pragma omp parallel for default(none) private(ii) shared(num, S,  N,  RO, E1, E2, CHA, mb , mb_8D ) if(num>1)
    for (ii = 0; ii < num; ii++) {
        size_t a = ii / (N * S);
        size_t s = (ii - a * N * S) / (N);
        size_t n = ii - a * N * S - s * N;

        size_t index_in=indice_slice_mb[a];
        size_t index_out=indice_mb[a];

        size_t usedS = s;
        if (usedS >= S) usedS = S - 1;

        size_t usedN = n;
        if (usedN >= N) usedN = N - 1;

        std::complex<float> * in = &(mb(0, 0, 0, 0, n, s, index_in));
        std::complex<float> * out = &(mb_8D(0, 0, 0, 0,  0, index_out, 0, s));

        memcpy(out , in, sizeof(std::complex<float>)*RO*E1*E2*CHA);

    }
}


void GenericReconSMSPrepGadget::reorganize_mb_data_to_8D(hoNDArray< std::complex<float> >& mb,hoNDArray< std::complex<float> >& mb_8D )
{
    size_t RO=mb.get_size(0);
    size_t E1=mb.get_size(1);
    size_t E2=mb.get_size(2);
    size_t CHA=mb.get_size(3);
    size_t N=mb.get_size(4);
    size_t S=mb.get_size(5);
    size_t SLC=mb.get_size(6);

    size_t index_in;
    size_t index_out;

    for (int a = 0; a < lNumberOfStacks_; a++)
    {
        index_in=indice_slice_mb[a];
        index_out=indice_mb[a];

        for (size_t s = 0; s < S; s++)
        {
            size_t usedS = s;
            if (usedS >= S) usedS = S - 1;

            for (size_t n = 0; n < N; n++)
            {
                size_t usedN = n;
                if (usedN >= N) usedN = N - 1;

                std::complex<float> * in = &(mb(0, 0, 0, 0, n, s, index_in));
                std::complex<float> * out = &(mb_8D(0, 0, 0, 0,  0, index_out, 0, s));

                memcpy(out , in, sizeof(std::complex<float>)*RO*E1*E2*CHA);

            }
        }
    }

}



//sur les données single band
void GenericReconSMSPrepGadget::create_stacks_of_slices_directly(hoNDArray< std::complex<float> >& data, hoNDArray< std::complex<float> >& new_stack, arma::uvec indice)
{

    size_t RO=data.get_size(0);
    size_t E1=data.get_size(1);
    size_t E2=data.get_size(2);
    size_t CHA=data.get_size(3);
    size_t N=data.get_size(4);
    size_t S=data.get_size(5);

    size_t MB=new_stack.get_size(4);
    size_t STK=new_stack.get_size(5);

    size_t n, s, a, m;
    size_t index;

    // copy of the data in the 8D array

    for (a = 0; a < STK; a++) {

        for (m = 0; m < MB; m++) {

            index = MapSliceSMS(a,m);

            for (s = 0; s < S; s++)
            {
                for (n = 0; n < N; n++)
                {
                    std::complex<float> * in = &(data(0, 0, 0, 0, n, s, indice(index)));
                    std::complex<float> * out = &(new_stack(0, 0, 0, 0, m, a, n, s));
                    memcpy(out , in, sizeof(std::complex<float>)*RO*E1*E2*CHA);
                }
            }
        }
    }
}



//sur les données single band
void GenericReconSMSPrepGadget::create_stacks_of_slices_directly_open(hoNDArray< std::complex<float> >& data, hoNDArray< std::complex<float> >& new_stack, arma::uvec indice)
{

    size_t RO=data.get_size(0);
    size_t E1=data.get_size(1);
    size_t E2=data.get_size(2);
    size_t CHA=data.get_size(3);
    size_t N=data.get_size(4);
    size_t S=data.get_size(5);

    size_t MB=new_stack.get_size(4);
    size_t STK=new_stack.get_size(5);

    long long num = STK * MB * N * S;
    long long ii;

#pragma omp parallel for default(none) private(ii) shared(num, MB , STK, S, N, indice, new_stack, data,RO,E1,E2,CHA) if(num>1)
    for (ii = 0; ii < num; ii++) {

        size_t   a = ii / (S * MB* N);
        size_t   m = (ii - a * S * MB* N) / (S* N );
        size_t  s = (ii - a * S * MB* N - m * S* N )  /  (N);
        size_t  n=  ii - a * S * MB* N - m * S* N  -s *  N;

        size_t index = MapSliceSMS(a,m);

        std::complex<float> * in = &(data(0, 0, 0, 0, n, s, indice(index)));
        std::complex<float> * out = &(new_stack(0, 0, 0, 0, m, a, n, s));
        memcpy(out , in, sizeof(std::complex<float>)*RO*E1*E2*CHA);
    }
}



GADGET_FACTORY_DECLARE(GenericReconSMSPrepGadget)
}

