require 'spec_helper'

describe "layouts/application" do
  before do
    render
  end

  it "ブラウザのタイトルが表示されること" do
    assert_select("title", "ヵェの部屋♪")
  end

  it "サイト名が表示されること" do
    assert_select("a.brand", "ヵェの部屋♪")
  end

  it "メインメニューにTOPが表示されること" do
    assert_select("ul.nav > li > a", "HOME")
  end

  it "メインメニューにBLOGが表示されること" do
    assert_select("ul.nav > li > a", "BLOG")
  end
end
