require 'spec_helper'

describe Ticket do
  let(:project) { create(:project_example) }
  let(:user) { create(:user_example) }
  let(:version) { create(:version_example) }
  let(:priority) { create(:priority_example) }
  let(:status) { create(:status_example) }
  let(:tracker) { create(:tracker_example) }
  let(:ticket) { create(:ticket_example, project_id: project.id, user_id: user.id, created_by: user.id, version_id: version.id, priority_id: priority.id, status_id: status.id, tracker_id: tracker.id) }

  describe "record" do
    it "progress default is 0" do
      expect(ticket.progress).to eq 0
    end

    describe "belongs to" do
      it "project." do
        expect(ticket.project).to eq project
      end

      it "priority." do
        expect(ticket.priority).to eq priority
      end

      it "status." do
        expect(ticket.status).to eq status
      end

      it "tracker." do
        expect(ticket.tracker).to eq tracker
      end

      it "user." do
        expect(ticket.user).to eq user
      end

      it "version." do
        expect(ticket.version).to eq version
      end
    end

    describe "has many" do
      before do
        category1 = create(:ticket_category_example)
        category2 = create(:ticket_category_example)
        ticket.categorizations << create(:categorization_example, category_id: category1.id)
        ticket.categorizations << create(:categorization_example, category_id: category2.id)
      end

      it "categorizations." do
        expect(ticket.reload.categorizations.count).to eq 2
      end

      it "categories." do
        expect(ticket.categories.count).to eq 2
      end
    end

    it "create a ticket." do
      create(:ticket_example, project_id: project.id, user_id: user.id, created_by: user.id, version_id: version.id, priority_id: priority.id, status_id: status.id, tracker_id: tracker.id)
      expect(Ticket).to have(1).records
    end

    describe "acts_as_paranoid" do
      it "destroy a ticket." do
	expect(ticket.deleted_at).to be_nil
        ticket.destroy
	expect(ticket.deleted_at).not_to be_nil
      end
    end
  end

  describe "validation test" do
    context "when blank." do
      it "title is required." do
        ticket = build(:ticket_example, title: "", project_id: project.id, user_id: user.id, created_by: user.id, version_id: version.id, priority_id: priority.id, status_id: status.id, tracker_id: tracker.id)
        expect(ticket).to have(1).errors_on(:title)
      end

      it "content is not required." do
        ticket = build(:ticket_example, content: "", project_id: project.id, user_id: user.id, created_by: user.id, version_id: version.id, priority_id: priority.id, status_id: status.id, tracker_id: tracker.id)
        expect(ticket).to have(0).errors_on(:content)
      end

      it "status is required." do
        ticket = build(:ticket_example, project_id: project.id, user_id: user.id, created_by: user.id, version_id: version.id, priority_id: priority.id, status_id: nil, tracker_id: tracker.id)
        expect(ticket).to have(1).errors_on(:status_id)
      end

      it "priority is required." do
        ticket = build(:ticket_example, project_id: project.id, user_id: user.id, created_by: user.id, version_id: version.id, priority_id: nil, status_id: status.id, tracker_id: tracker.id)
        expect(ticket).to have(1).errors_on(:priority_id)
      end

      it "version is required." do
        ticket = build(:ticket_example, project_id: project.id, user_id: user.id, created_by: user.id, version_id: nil, priority_id: priority.id, status_id: status.id, tracker_id: tracker.id)
        expect(ticket).to have(1).errors_on(:version_id)
      end

      it "project is required." do
        ticket = build(:ticket_example, project_id: nil, user_id: user.id, created_by: user.id, version_id: version.id, priority_id: priority.id, status_id: status.id, tracker_id: tracker.id)
        expect(ticket).to have(1).errors_on(:project_id)
      end

      it "tracker is required." do
        ticket = build(:ticket_example, project_id: project.id, user_id: user.id, created_by: user.id, version_id: version.id, priority_id: priority.id, status_id: status.id, tracker_id: nil)
        expect(ticket).to have(1).errors_on(:tracker_id)
      end
    end

    context "when exceed max characters." do
      it "with title." do
        ticket = build(:ticket_example, title: "a" * (MAX_TEXT_FIELD_LENGTH + 1), project_id: project.id, user_id: user.id, created_by: user.id, version_id: version.id, priority_id: priority.id, status_id: status.id, tracker_id: tracker.id)
        expect(ticket).to have(1).errors_on(:title)
      end

      it "with content." do
        ticket = build(:ticket_example, content: "a" * (MAX_TEXT_AREA_LENGTH + 1), project_id: project.id, user_id: user.id, created_by: user.id, version_id: version.id, priority_id: priority.id, status_id: status.id, tracker_id: tracker.id)
        expect(ticket).to have(1).errors_on(:content)
      end
    end
  end
end
