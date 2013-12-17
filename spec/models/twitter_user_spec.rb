require 'spec_helper'

describe TwitterUser do
  describe "record" do
    it "type is not null." do
      user = build(:twitter_user_example)
      expect(user.type).to eq "TwitterUser"
    end

    it "provider is provider name." do
      user = build(:twitter_user_example)
      expect(user.provider).to eq "twitter"
    end

    it "create a twitter user." do
      create(:twitter_user_example)
      expect(TwitterUser).to have(1).records
    end

    describe "acts_as_paranoid" do
      it "destroy a twitter user." do
        user = create(:twitter_user_example)
	expect(user.deleted_at).to be_nil
        user.destroy
	expect(user.deleted_at).not_to be_nil
      end
    end
  end

  describe "validation test" do
    context "when blank." do
      it "email is not required." do
        user = build(:twitter_user_example, email: "")
        expect(user).to have(0).errors_on(:email)
      end

      it "twitter uid is required." do
        user = build(:twitter_user_example, uid: nil)
        expect(user).to have(1).errors_on(:uid)
      end

      it "twitter screen_name is required." do
        user = build(:twitter_user_example, screen_name: nil)
        expect(user).to have(1).errors_on(:screen_name)
      end
    end
  end
end
