# frozen_string_literal: true

require "daxtra/client"

RSpec.describe Daxtra::Client do
  let(:service) { described_class.new(account: account) }
  let(:resume)  { Document.instance.resume.read }
  let(:account) { "test" }

  describe "#post_profile_full" do
    subject { service.post_profile_full(resume) }

    let(:response) { JSON.parse(daxtra_response.body) }

    let(:daxtra_response) do
      VCR.use_cassette("parse/resume") { subject }
    end

    it "returns parsed resume in JSON" do
      expect(response["Resume"]).to be_a Hash
    end

    context "when resume is empty" do
      let(:resume) { Document.instance.empty_resume.read }

      it "returns parsed resume in JSON" do
        expect(response["Resume"]).to be_a Hash
      end
    end

    context "when resume is invalid" do
      let(:resume) { Document.instance.invalid_resume.read }

      it "returns parsed resume in JSON" do
        expect(response["Resume"]).to be_a Hash
      end
    end
  end

  describe "#post_convert_2_html" do
    subject { service.post_convert_2_html(resume) }

    let(:response) { daxtra_response.body }

    let(:daxtra_response) do
      VCR.use_cassette("convert/resume") { subject }
    end

    it "returns parsed resume as a String with html" do
      expect(response).to be_a String
    end

    context "when resume is empty" do
      let(:resume) { Document.instance.empty_resume }

      it "returns parsed resume as a String with html" do
        expect(response).to be_a String
      end
    end

    context "when resume is invalid" do
      let(:resume) { Document.instance.invalid_resume }

      it "returns parsed resume as a String with html" do
        expect(response).to be_a String
      end
    end
  end
end
