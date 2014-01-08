require "spec_helper"

describe Admin::MailFormsController do
  describe "routing" do
    it "routes to #index." do
      expect(get "admin/mail_forms").to route_to("admin/mail_forms#index")
    end

    it "no route matches #new." do
      expect(get "admin/mail_forms/new").not_to route_to("admin/mail_forms#new")
    end

    it "no route matches #create." do
      expect(post "admin/mail_forms").not_to route_to("admin/mail_forms#create")
    end

    it "no route matches #edit." do
      expect(get "admin/mail_forms/1/edit").not_to route_to("admin/mail_forms#edit", id: "1")
    end

    it "no route matches #update." do
      expect(patch "admin/mail_forms/1").not_to route_to("admin/mail_form#update", id: "1")
    end

    it "routes to #destroy." do
      mail_form = create(:mail_form_example)
      expect(delete "admin/mail_forms/1").to route_to("admin/mail_forms#destroy", id: "1")
    end
  end
end
