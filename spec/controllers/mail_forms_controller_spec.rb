require 'spec_helper'

describe MailFormsController do
  describe "#create" do
    context "when data is normal." do
      it "send a mail." do
        expect { post :create, { mail_form: { content: "Content" }}}.to change(MailForm, :count).by(1)
      end
    end

    context "when content is blank." do
      it "cannot send a mail." do
        expect { post :create, { mail_form: { content: "" }}}.to change(MailForm, :count).by(0)
      end
    end
  end
end
