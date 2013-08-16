require 'spec_helper'

describe MailForm do

  describe "validation" do
    context "空のメールを送信された場合" do
      subject(:mail) { MailForm.new(content: "") }
      it "登録できないこと" do
        expect(mail.save).to eq false
      end

      it "validationエラーが発生すること" do
        expect(mail).to have(1).errors_on(:content)
      end
    end

    context "100文字のメールを送信された場合" do
      subject(:mail) { MailForm.new(content: "o" * 1000) }

      it "登録できること" do
        expect(mail.save).to eq true
      end
    end
  end
end
