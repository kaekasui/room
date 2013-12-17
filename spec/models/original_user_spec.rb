require 'spec_helper'

describe OriginalUser do
  describe "record" do
    it "type is not null." do
      user = build(:original_user_example)
      expect(user.type).to eq "OriginalUser"
    end

    it "create a original user." do
      create(:original_user_example)
      expect(OriginalUser).to have(1).records
    end

    describe "acts_as_paranoid" do
      it "destroy a original user." do
        user = create(:original_user_example)
	expect(user.deleted_at).to be_nil
        user.destroy
	expect(user.deleted_at).not_to be_nil
      end
    end
  end

  describe "validation test" do
    context "when blank." do
      it "email is required." do
        user = build(:original_user_example, email: "")
        expect(user).to have(1).errors_on(:email)
      end

      it "password is required." do
        user = build(:original_user_example, password: "")
	expect(user).to have(1).errors_on(:password)
      end

      it "password confirmation is required." do
        user = build(:original_user_example, password_confirmation: "")
	expect(user).to have(1).errors_on(:password_confirmation)
      end
    end

    context "when unmatched." do
      it "between password and password confirmation" do
        user = build(:original_user_example, password: "123456", password_confirmation: "123457")
	expect(user).to have(1).errors_on(:password_confirmation)
      end

      it "email is mail address format." do
        user = build(:original_user_example, email: "a")
        expect(user).to have(1).errors_on(:email)
      end
    end

    context "when not exceed minimum(6) characters." do
      it "with password." do
        user = build(:original_user_example, password: "password")
	expect(user).to have(0).errors_on(:password)
      end
    end

    context "when exceed minimum(6) characters." do
      it "with password." do
        user = build(:original_user_example, password: "pass")
	expect(user).to have(1).errors_on(:password)
      end
    end

    context "when not exceed max characters." do
      it "with email." do
        user = build(:original_user_example, email: "a" * (MAX_LONG_TEXT_FIELD_LENGTH - 12) + "@example.com")
        expect(user).to have(0).errors_on(:email)
      end

      it "with password." do
        user = build(:original_user_example, password: "a" * MAX_TEXT_FIELD_LENGTH)
	expect(user).to have(0).errors_on(:password)
      end
    end

    context "when exceed max characters." do
      it "with email." do
        user = build(:original_user_example, email: "a" * (MAX_LONG_TEXT_FIELD_LENGTH - 11) + "@example.com")
        expect(user).to have(1).errors_on(:email)
      end

      it "with password." do
        user = build(:original_user_example, password: "a" * (MAX_TEXT_FIELD_LENGTH + 1))
	expect(user).to have(1).errors_on(:password)
      end
    end
  end
end
