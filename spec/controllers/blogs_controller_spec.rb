require 'spec_helper'

describe BlogsController do

  describe :index do
    it "ブログの一覧画面が表示できること" do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe :show do
    it "ブログの詳細画面が表示できること" do
      @blog = FactoryGirl.create(:blog)
      get :show, id: @blog.id
      expect(response).to render_template(:show)
    end
  end
end
