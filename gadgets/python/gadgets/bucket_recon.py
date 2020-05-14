import numpy as np
from ismrmrdtools import transform
from gadgetron import Gadget,IsmrmrdDataBuffered, IsmrmrdReconBit, SamplingLimit,SamplingDescription

import ismrmrd
import ismrmrd.xsd

class BucketRecon(Gadget):
    def __init__(self, next_gadget=None):
        Gadget.__init__(self,next_gadget)
        self.header = None
        self.enc = None
        self.mySeries = 0
        self.myCounter = 0

    def process_config(self, conf):
        self.header = ismrmrd.xsd.CreateFromDocument(conf)
        self.enc = self.header.encoding[0]

    def process(self, recondata):

        print(np.shape(recondata[0].data.data))

        image = transform.transform_kspace_to_image(recondata[0].data.data,dim=(0,1,2))
        print(np.shape(image))
        #image = np.reshape(image,(image.shape[0],image.shape[1],image.shape[2],image.shape[3]))

        #Create a new image header and transfer value
        print(type(recondata[0].data.headers))
        print(np.shape(recondata[0].data.headers))
        acq = np.ravel(recondata[0].data.headers)[0]
        print(type(acq))

        print(acq.active_channels)
        print(acq.idx.slice)

        dims=np.shape(recondata[0].data.data)
        print(dims)

        for s in range(dims[6]):

          img_head = ismrmrd.ImageHeader()
          
          img_head.channels = acq.active_channels
          img_head.slice = s #acq.idx.slice
          img_head.matrix_size = (image.shape[0],image.shape[1],image.shape[2])
          img_head.position = acq.position
          img_head.read_dir = acq.read_dir
          img_head.phase_dir = acq.phase_dir
          img_head.slice_dir = acq.slice_dir
          img_head.patient_table_position = acq.patient_table_position
          img_head.acquisition_time_stamp = acq.acquisition_time_stamp
          img_head.image_index = 0 
          img_head.image_series_index = 0
          img_head.data_type = ismrmrd.DATATYPE_CXFLOAT

          #Return image to Gadgetron
          print(np.shape(image[:,:,:,:,0,0,s]))
          self.put_next(img_head,image[:,:,:,:,:,:,s])
          print("Slice ", img_head.slice)
          print("----------------------------------------------")
          return 0    
        #print "Returning to Gadgetron"
 