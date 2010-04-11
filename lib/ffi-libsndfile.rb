require 'ffi'

module FFI
  module LibSndFile
    VERSION = File.read('VERSION')
    extend FFI::Library

    # HACK HACK HACK, what's a better way?
    ffi_lib "/opt/local/lib/libsndfile.dylib"

    SFM_READ  = 0x10
    SFM_WRITE = 0x20
    SFM_RDWR  = 0x30

    # = Details
    # SF_INFO is the data structure used to contain basic information about the sound file loaded
    class SF_INFO < FFI::Struct
      layout  :frame, :int64,
              :samplerate, :int,
              :channels, :int,
              :format, :int,
              :sections, :int,
              :seekable, :int
    end

    attach_function :sf_open, [:string, :int, SF_INFO], :pointer
    attach_function :sf_close, [:pointer], :int
    attach_function :sf_read_int, [:pointer, :pointer, :int64], :int64
  end
end
