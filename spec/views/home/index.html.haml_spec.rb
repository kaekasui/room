require 'spec_helper'

describe "home/index" do
  it "紹介文が表示されること" do
    render
    expect(rendered).to have_selector("div.introduction", content: I18n.t("home.introduction").gsub("\n", ""))
  end
end
