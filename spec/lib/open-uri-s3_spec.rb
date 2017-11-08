# frozen_string_literal: true
require 'open-uri-s3'

describe URI::S3 do
  let(:uri){ 's3://some-bucket/key/to/object'}

  let(:client) { instance_double('Aws::S3::Client') }
  let(:bucket) { instance_double('Aws::S3::Bucket') }

  let(:object) { instance_double('Aws::S3::Object') }
  let(:bucket_loc) { instance_double('Aws::S3::Types::GetBucketLocationOutput', location_constraint: 'eu-west-1') }
  let(:object_out) { instance_double("Aws::S3::Types::GetObjectOutput") }
  let(:body) { StringIO.new('contents') }

  before do
    allow(Aws::S3::Client).to receive(:new).and_return(client)
    allow(Aws::S3::Bucket).to receive(:new).and_return(bucket)

    allow(client).to receive(:get_bucket_location).and_return(bucket_loc)
    allow(object).to receive(:get).and_return(object_out)
    allow(object_out).to receive(:body).and_return(body)
    allow(bucket).to receive(:object).with('key/to/object').and_return(object)
  end

  describe 'open' do
    it 'returns the S3 object' do
      expect(open(uri).read).to eq 'contents'
    end

    context 'when a block is given' do
      it 'yields the object' do
        expect{ |b| open(uri, &b) }.to yield_with_args(body)
      end

      it 'returns the result of the block' do
        expect(open(uri){ 'result' }).to eq 'result'
      end
    end
  end

  describe '#read' do
    it 'reads the object' do
      expect(URI(uri).read).to eq 'contents'
    end
  end
end
