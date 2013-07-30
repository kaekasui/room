require 'spec_helper'

describe "home/index" do
  before do
    render
  end

  it "紹介文が表示されること" do
    expect(rendered).to have_selector("div.introduction", content: I18n.t("home.introduction").gsub("\n", ""))
  end

  describe "サイドメニュー" do
    it "プロフィールが表示されること" do
      expect(view.content_for(:sidebar)).to have_selector("div.sidebar-nav > h4", content: I18n.t("side_menu.profile"))
    end

    it "メニューが表示されること" do
      expect(view.content_for(:sidebar)).to have_selector("div.sidebar-nav > h4", content: I18n.t("side_menu.menu"))
    end
  end
end
