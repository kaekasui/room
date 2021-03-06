require 'spec_helper'

describe Project do
  describe "record" do
    let(:project) { create(:project_example) }
    let(:user) { create(:user_example) }
    let(:version) { create(:version_example) }
    let(:priority) { create(:priority_example) }
    let(:status) { create(:status_example) }
    let(:tracker) { create(:tracker_example) }

    it "has 2 tickets." do
      tickets1 = create(:ticket_example, project_id: project.id, user_id: user.id, created_by: user.id, version_id: version.id, priority_id: priority.id, status_id: status.id, tracker_id: tracker.id)
      tickets2 = create(:ticket_example, project_id: project.id, user_id: user.id, created_by: user.id, version_id: version.id, priority_id: priority.id, status_id: status.id, tracker_id: tracker.id)
      expect(project.reload.tickets).to eq([tickets1, tickets2])
    end

    it "has 2 ticket categories" do
      categories1 = create(:ticket_category_example, project_id: project.id)
      categories2 = create(:ticket_category_example, project_id: project.id)
      expect(project.reload.categories).to eq([categories1, categories2])
    end

    it "create a project." do
      create(:project_example)
      expect(Project).to have(1).records
    end

    describe "acts_as_paranoid" do
      it "destroy a project." do
        project = create(:project_example)
	expect(project.deleted_at).to be_nil
        project.destroy
	expect(project.deleted_at).not_to be_nil
      end
    end
  end

  describe "validation test" do
    context "when blank." do
      it "title is required." do
        project = build(:project_example, title: nil)
        expect(project).to have(1).errors_on(:title)
      end

      it "content is not required." do
        project = build(:project_example, content: nil)
        expect(project).to have(0).errors_on(:content)
      end
    end

    context "when exceed max characters." do
      it "with title." do
        project = build(:project_example, title: "a" * (MAX_TEXT_FIELD_LENGTH + 1))
        expect(project).to have(1).errors_on(:title)
      end
    end
  end
end
