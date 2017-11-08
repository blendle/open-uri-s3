# frozen_string_literal: true
require 'aws-sdk-s3'
require 'open-uri'
require 'uri'

module URI
  class S3 < Generic
    # @return [AWS::S3::S3Object] S3 object (quacks like IO)
    def open(*_args)
      options = {}
      if ENV['AWS_S3_ENDPOINT']
        options[:endpoint] = URI(ENV['AWS_S3_ENDPOINT'])
      end

      client = Aws::S3::Client.new(options)

      bucket_location = client.get_bucket_location(bucket: hostname)
      region = bucket_location.location_constraint

      options = options.merge(region: region)
      bucket = Aws::S3::Bucket.new(hostname, options)

      key = self.path[1..-1]
      object = bucket.object(key).get.body

      if block_given?
        yield object
      else
        object
      end
    end

    def read
      open(to_s).read
    end
  end

  @@schemes['S3'] = S3
end
