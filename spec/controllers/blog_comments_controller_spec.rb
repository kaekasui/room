require 'spec_helper'

describe BlogCommentsController do

  describe :create do
    context "正常な値を入れた場合" do
      before do
        @blog = FactoryGirl.create(:blog)
        @blog_comment = FactoryGirl.build(:blog_comment)
        @blog_comment.blog_id = @blog.id
        @blog_comment.save
      end

      it "エラーが発生しないこと" do
        expect(@blog_comment.errors.count).to eq 0
      end

      it "ブログのコメントが登録できること" do
        expect(@blog.blog_comments.count).to eq 1
      end
    end

    context "正常ではない値を入れた場合" do
      before do
        @blog = FactoryGirl.create(:blog)
        @blog_comment = FactoryGirl.build(:expective_blog_comment)
        @blog_comment.blog_id = @blog.id
        @blog_comment.save
      end

      it "エラーが発生すること" do
        expect(@blog_comment).to have(1).errors_on(:author)
        expect(@blog_comment).to have(1).errors_on(:content)
      end

      it "ブログのコメントが登録できないこと" do
        expect(@blog.blog_comments.count).to eq 0
      end
    end
  end
end
