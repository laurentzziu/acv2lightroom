require 'spec_helper'

describe Acv2lrtemplate::Parser do
  let(:invalid_extension) { File.join(Acv2lrtemplate.spec, 'support', 'files', 's_line.txt') }
  let(:valid_file) { File.join(Acv2lrtemplate.spec, 'support', 'files', 's_line.acv') }

  context "invalid file" do
    it "should raise error when no file provided" do
      expect {
        Acv2lrtemplate::Parser.new
      }.to raise_error(ArgumentError)
    end

    it "should raise error when the filename is empty" do
      expect {
        Acv2lrtemplate::Parser.new(nil)
      }.to raise_error(Acv2lrtemplate::Errors::Validator::NoFileProvided)
    end

    it "should raise error when the file extension is not supported" do
      expect {
        Acv2lrtemplate::Parser.new(invalid_extension)
      }.to raise_error(Acv2lrtemplate::Errors::Validator::InvalidFileExtension)
    end
  end

  context "valid file" do
    it "should have the 'acv_file' attribute" do
      expect(Acv2lrtemplate::Parser.new(valid_file).acv_file).to_not be_nil
    end

    it "should have the 'curves' attribute" do
      expect(Acv2lrtemplate::Parser.new(valid_file).curves).to_not be_nil
    end
  end
end
