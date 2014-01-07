require 'spec_helper'

describe Category do
  describe "record" do
    let(:project) { create(:project_example) }
    let(:category) { create(:category_example, project_id: project.id) }

    it "belongs to a project." do
      expect(category.project).to eq project 
    end

    it "have 2 ticket categorizations." do
      user = create(:user_example)
      version = create(:version_example)
      priority = create(:priority_example)
      status = create(:status_example)
      tracker = create(:tracker_example)
      ticket1 = create(:ticket_example, project_id: project.id, user_id: user.id, created_by: user.id, version_id: version.id, priority_id: priority.id, status_id: status.id, tracker_id: tracker.id)
      ticket2 = create(:ticket_example, project_id: project.id, user_id: user.id, created_by: user.id, version_id: version.id, priority_id: priority.id, status_id: status.id, tracker_id: tracker.id)

      create(:categorization_example, registrable_id: ticket1.id, category_id: category.id)
      create(:categorization_example, registrable_id: ticket2.id, category_id: category.id)
      expect(category.categorizations.count).to eq 2
    end

    it "create a ticket category." do
      category
      expect(Category).to have(1).records
    end

    describe "acts_as_paranoid" do
      it "destroy a ticket category." do
	expect(category.deleted_at).to be_nil
        category.destroy
	expect(category.deleted_at).not_to be_nil
      end
    end
  end

  describe "validation test" do
    context "when blank." do
      it "name is required." do
        category = build(:category_example, name: nil)
        expect(category).to have(1).errors_on(:name)
      end
    end

    context "when exceed max characters." do
      it "with name." do
        category = build(:category_example, name: "a" * (MAX_TEXT_FIELD_LENGTH + 1))
        expect(category).to have(1).errors_on(:name)
      end
    end
  end
end
