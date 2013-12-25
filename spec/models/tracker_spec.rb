require 'spec_helper'

describe Tracker do
  describe "record" do
    it "have 2 tickets." do
      project = create(:project_example)
      user = create(:user_example)
      version = create(:version_example)
      priority = create(:priority_example)
      status = create(:status_example)
      tracker = create(:tracker_example)

      tickets1 = create(:ticket_example, project_id: project.id, user_id: user.id, created_by: user.id, version_id: version.id, priority_id: priority.id, status_id: status.id, tracker_id: tracker.id)
      tickets2 = create(:ticket_example, project_id: project.id, user_id: user.id, created_by: user.id, version_id: version.id, priority_id: priority.id, status_id: status.id, tracker_id: tracker.id)
      expect(tracker.reload.tickets).to eq([tickets1, tickets2])
    end

    it "create a tracker." do
      create(:tracker_example)
      expect(Tracker).to have(1).records
    end

    describe "acts_as_paranoid" do
      it "destroy a tracker." do
        tracker = create(:tracker_example)
	expect(tracker.deleted_at).to be_nil
        tracker.destroy
	expect(tracker.deleted_at).not_to be_nil
      end
    end
  end

  describe "validation test" do
    context "when blank." do
      it "name is required." do
        tracker = build(:tracker_example, name: nil)
        expect(tracker).to have(1).errors_on(:name)
      end
    end

    context "when exceed max characters." do
      it "with name." do
        tracker = build(:tracker_example, name: "a" * (MAX_TEXT_FIELD_LENGTH + 1))
        expect(tracker).to have(1).errors_on(:name)
      end
    end
  end
end
