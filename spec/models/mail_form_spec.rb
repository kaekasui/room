require 'spec_helper'

describe MailForm do

  describe "validation" do
    context "when blank." do
      it "content is required." do
        mail = build(:mail_example, content: "")
        expect(mail).to have(1).errors_on(:content)
      end
    end

    context "when exceed max characters." do
      it "with the content." do
        mail = build(:mail_example, content: "a" * (MAX_TEXT_AREA_LENGTH + 1))
        expect(mail).to have(1).errors_on(:content)
      end
    end

    context "when not exceed max characters." do
      it "with the content." do
        mail = build(:mail_example, content: "a" * (MAX_TEXT_AREA_LENGTH))
        expect(mail).to have(0).errors_on(:content)
      end
    end
  end

  describe "record" do
    describe "acts_as_paranoid" do
      it "destroy a mail." do
        mail = create(:mail_example)
	expect(mail.deleted_at).to be_nil
        mail.destroy
	expect(mail.deleted_at).not_to be_nil
      end
    end
  end
end
