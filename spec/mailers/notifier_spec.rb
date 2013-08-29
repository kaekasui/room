require "spec_helper"

describe Notifier do
  describe "create_blog" do
    let(:mail) { Notifier.create_blog }

    it "renders the headers" do
      mail.subject.should eq("Create blog")
      mail.to.should eq(["to@example.org"])
      mail.from.should eq(["from@example.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hi")
    end
  end

end
