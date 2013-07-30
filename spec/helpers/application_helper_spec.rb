require 'spec_helper'

describe ApplicationHelper do
  describe "#to_skip" do
    it "改行コードで改行されること" do
      expect(helper.to_skip("to skip\nto skip")).to eq("to skip<br />to skip")
    end
  end
end
