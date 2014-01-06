require 'spec_helper'

describe Admin::MailFormsController do
  before do
    sign_in create(:user_example, admin: true)
  end

  describe "#index" do
    it "is success." do
      get :index
      expect(response.status).to eq 200
    end

    it "access :index" do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe "#destroy" do
    let(:mail_form) { create(:mail_form_example) }
    before do
    end

    it "is success." do
      delete :destroy, { id: mail_form.id }
      expect(response.status).to eq 302
    end

    it "update the 'deleted_at'." do
      expect(mail_form.deleted_at).to be_nil
      delete :destroy, { id: mail_form.id }
      expect(mail_form.reload.deleted_at).not_to be_nil
    end

    it "redirect to :index" do
      delete :destroy, { id: mail_form.id }
      expect(response).to redirect_to admin_mail_forms_path
    end
  end
end
