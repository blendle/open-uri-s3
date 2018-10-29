# frozen_string_literal: true

require 'open-uri'
require 'uri'

module URI
  class S3 < Generic
    def open(*_args)
      warn "open-uri-s3#open is deprecated, please replace. called from #{caller_locations}"
    end

    def read
      warn "open-uri-s3#read is deprecated, please replace. called from #{caller_locations}"
    end
  end
end
