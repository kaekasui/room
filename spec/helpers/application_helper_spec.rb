require 'spec_helper'

describe ApplicationHelper do
  describe "#to_skip" do
    it "改行コードで改行されること" do
      expect(helper.to_skip("to skip\nto skip")).to eq("to skip<br />to skip")
    end
  end

  describe "#icon" do
    it "アイコンのURLが生成されること" do
      expect(helper.icon).to eq("icon_images/clover.gif")
    end
  end
end
