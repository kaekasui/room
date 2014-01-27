require 'spec_helper'

describe "home/index" do
  before do
    render
  end

  it "display the introduction." do
    expect(rendered).to have_selector("div.introduction", content: I18n.t("home.introduction").gsub("\n", ""))
  end

  describe "side menu" do
    it "display the profile." do
      expect(view.content_for(:sidebar)).to have_selector(".well > h4", content: I18n.t("side_menu.profile"))
    end

    it "display the menu." do
      expect(view.content_for(:sidebar)).to have_selector(".well > h4", content: I18n.t("side_menu.menu"))
    end
  end
end
