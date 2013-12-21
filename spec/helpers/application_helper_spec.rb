require 'spec_helper'

describe ApplicationHelper do
  describe "#to_skip" do
    it "break." do
      expect(helper.to_skip("to skip\nto skip")).to eq("to skip<br />to skip")
    end
  end

  describe "#icon" do
    it "create a url of the icon" do
      expect(helper.icon).to eq("icon_images/clover.gif")
    end
  end

  describe "#asterisk" do
    let (:blog) { create(:blog_example) }

    context "compulsory input" do
      it "display asterisk." do
        expect(helper.asterisk(blog, :title)).to include("*")
      end
    end

    context "not compulsory input" do
      it "display no asterisk." do
        expect(helper.asterisk(blog, :contents2)).to be_nil
      end
    end
  end

  describe "#admin_menu_list" do
    context "blog" do
      it "display blogs list menu." do
        expect(helper.admin_menu_list("blog")[I18n.t("admin_menu.blogs")]).to eq "admin_blogs_path"
      end
    end

    context "ticket" do
      it "display tickets list menu." do
        expect(helper.admin_menu_list("ticket")[I18n.t("admin_menu.tickets")]).to eq "admin_tickets_path"
      end
    end

    context "setting" do
      it "display versions list menu." do
        expect(helper.admin_menu_list("setting")[I18n.t("admin_menu.versions")]).to eq "admin_versions_path"
      end
    end

    context "the others" do
      it "display no page" do
        expect(helper.admin_menu_list("abc")).to be_nil
      end
    end
  end

  describe "#current_version" do
    it "display current version." do
      version = create(:version_example, current: true)
      expect(helper.current_version).to eq version
    end
  end
end
