require 'spec_helper'

describe Acv2lrtemplate::Exporter do
  let(:valid_file) { File.join(Acv2lrtemplate.spec, 'support', 'files', 's_line.acv') }
  let(:parsed_file) { Acv2lrtemplate::Parser.new(valid_file) }
  let(:exported_file) { Acv2lrtemplate::Exporter.new(parsed_file.curves, parsed_file.acv_file) }

  context "invalid parameters" do
    it "should raise error when curves data is nil" do
      expect {
        Acv2lrtemplate::Exporter.new(nil, nil)
      }.to raise_error(Acv2lrtemplate::Errors::Exporter::CurvesDataInvalid)
    end

    it "should raise error when curves data is blank" do
      expect {
        Acv2lrtemplate::Exporter.new([], nil)
      }.to raise_error(Acv2lrtemplate::Errors::Exporter::CurvesDataInvalid)
    end

    it "should raise error when curves data is not an array" do
      expect {
        Acv2lrtemplate::Exporter.new({}, nil)
      }.to raise_error(Acv2lrtemplate::Errors::Exporter::CurvesDataInvalid)
    end
  end

  context "valid parameters" do
    context "before .export!" do
      it "should have a nil exported path" do
        expect(exported_file.exported_file).to be_nil
      end
    end

    context "after .export!" do
      it "should have a present exported path" do
        exported_file.export!
        expect(exported_file.exported_file).to_not be_nil
        expect(exported_file.exported_file).to be_kind_of(String)
      end
    end
  end
end
