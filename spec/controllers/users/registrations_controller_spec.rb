require 'spec_helper'

describe Users::RegistrationsController do
  before do
    @request.env["devise.mapping"] = Devise.mappings[:user]
  end

  describe "#new" do
    context "with non-logged-in user" do
      it "is success." do
        get :new
        expect(response.status).to eq 200
      end

      it "access :new" do
        get :new
        expect(response).to render_template(:new)
      end
    end

    context "with logged-in user" do
      before do
        controller.stub(:authenticate_user!).and_return true
	user = create(:original_user_example)
	sign_in user
      end

      it "is success." do
        get :new
        expect(response.status).to eq 302
      end

      it "access :root" do
        get :new
        expect(response).to redirect_to(root_path)
      end
   end

   after do
     sign_out :user
   end
  end

  describe "#create" do
    let(:user) { create(:original_user) }

    context "when data is normal." do
      before do
        post :create, { user: {email: "abc@example.com", password: "password" }}
      end

      it "sing up." do
        expect(response.status).to eq 302
      end

      it "redirect to top page after sign up." do
        expect(response).to redirect_to(root_path)
      end
    end

    context "when email is blank." do
      before do
        post :create, { user: {email: "", password: "password" }}
      end

      it "don't sign up." do
        expect(response).to render_template(:new)
      end
    end
  end
end
