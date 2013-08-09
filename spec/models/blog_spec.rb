require 'spec_helper'

describe Blog do

  describe "validation" do
    context "正常な値の場合" do
      subject(:blog) { FactoryGirl.build(:blog) }

      it "draftのデフォルトの値がfalseであること" do
        expect(blog.draft).to eq false
      end

      it "登録できること" do
        expect(blog.save).to be_true
      end
    end

    context "タイトルが空の場合" do
      subject(:blog) { FactoryGirl.build(:blog_with_no_title) }

      it "validationエラーが発生すること" do
        expect(blog).to have(1).errors_on(:title)
      end
      it "登録できないこと" do
        expect(blog.save).to be_false
      end
    end

    context "コンテンツ1が空の場合" do
      subject(:blog) { FactoryGirl.build(:blog_with_no_contents1) }

      it "validationエラーが発生すること" do
        expect(blog).to have(1).errors_on(:contents1)
      end
      it "登録できないこと" do
        expect(blog.save).to be_false
      end
    end
  end
end
