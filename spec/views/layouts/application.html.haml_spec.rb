require 'spec_helper'

describe "layouts/application" do
  before do
    view.stub(:current_user) { build(:original_user_example) }
  end

  it "display the brand." do
    render
    expect(rendered).to have_selector("a.navbar-brand", content: I18n.t("brand"))
  end

  it "display the 'HOME'." do
    render
    expect(rendered).to have_selector(".header li > a", content: I18n.t("menu.home"))
  end

  it "display the 'BLOG'." do
    render
    expect(rendered).to have_selector(".header li > a", content: I18n.t("menu.blog"))
  end
end
