require 'active_support/core_ext/string'
require 'paperclip-fake-storage'

describe Paperclip::Storage::Fake do
  let(:attachment) { Paperclip::Attachment.new('attachment', record, path: ':url') }
  let(:record) { Record.new }

  before { Paperclip::Attachment.default_options[:storage] = :fake }

  describe "#exists?" do
    subject { attachment.exists? }

    context "when content has been written into the attachment" do
      let(:content) { StringIO.new('I palindrome I') }
      before do
        attachment.assign(content)
        attachment.save
      end
      it { should be_truthy }

      context "and then destroyed" do
        before { attachment.destroy }
        it { should_not be_truthy }
      end
    end

    context "when no content has been written into the attachment" do
      it { should_not be_truthy }
    end
  end

  class Record
    include Paperclip::Glue

    class << self
      def validators
        [Paperclip::Validators::AttachmentFileTypeIgnoranceValidator.new(attributes: [:foo])]
      end

      def delete(*); end
    end

    attr_accessor :attachment_file_name

    def id; 7; end
    def run_callbacks(*); end
  end
end

