require "spec_helper"

describe MailFormsController do
  describe "routing" do
    it "no route matches #index." do
      expect(get "mail_forms").not_to route_to("mail_forms#index")
    end

    it "no route matches #show." do
      expect(get "mail_forms/1").not_to route_to("mail_forms#show")
    end

    it "no route matches #new." do
      expect(get "mail_forms/new").not_to route_to("mail_forms#new")
    end

    it "routes to #create." do
      expect(post "mail_forms").to route_to("mail_forms#create")
    end

    it "no route matches #edit." do
      expect(get "mail_forms/1/edit").not_to route_to("mail_forms#edit", id: "1")
    end

    it "no route matches #update." do
      expect(patch "mail_forms/1").not_to route_to("mail_form#update", id: "1")
    end

    it "no route matches #destroy." do
      expect(delete "mail_forms/1").not_to route_to("mail_forms#destroy", id: "1")
    end
  end
end
