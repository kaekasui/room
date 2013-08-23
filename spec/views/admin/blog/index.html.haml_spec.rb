require 'spec_helper'

describe "admin/blogs/index" do
  describe "ブログの記事" do
    before do
      @blogs = Blog.all
    end
  
    context "3件登録されている場合" do
      before do
        3.times { FactoryGirl.create(:blog) }
      end

      it "一覧に3件表示されること" do
        render
        expect(rendered).to have_selector("table.table > tr > td.post_at", count: 3)
      end
    end

    context "6件登録されている場合" do
      before do
        6.times { FactoryGirl.create(:blog) }
      end

      it "一覧に6件表示されること" do
        render
        expect(rendered).to have_selector("table.table > tr > td.post_at", count: 6)
      end
    end
  end
end
