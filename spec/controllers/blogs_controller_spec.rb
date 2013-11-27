require 'spec_helper'

describe BlogsController do

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

  describe "#show" do
    let(:blog) { create(:blog_example) }

    it "is success." do
      get :show, id: blog.id
      expect(response.status).to eq 200
    end

    it "access :show" do
      get :show, id: blog.id
      expect(response).to render_template(:show)
    end
 end
end
