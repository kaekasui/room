require 'spec_helper'

describe TicketCategory do
  describe "record" do
    let(:project) { create(:project_example) }
    let(:ticket_category) { create(:ticket_category_example, project_id: project.id) }

    it "belongs to a project." do
      expect(ticket_category.project).to eq project 
    end

    it "have 2 ticket category cases." do
      user = create(:user_example)
      version = create(:version_example)
      priority = create(:priority_example)
      status = create(:status_example)
      tracker = create(:tracker_example)
      ticket1 = create(:ticket_example, project_id: project.id, user_id: user.id, created_by: user.id, version_id: version.id, priority_id: priority.id, status_id: status.id, tracker_id: tracker.id)
      ticket2 = create(:ticket_example, project_id: project.id, user_id: user.id, created_by: user.id, version_id: version.id, priority_id: priority.id, status_id: status.id, tracker_id: tracker.id)

      create(:ticket_category_case_example, ticket_id: ticket1.id, ticket_category_id: ticket_category.id)
      create(:ticket_category_case_example, ticket_id: ticket2.id, ticket_category_id: ticket_category.id)
      expect(ticket_category.ticket_category_cases.count).to eq 2
    end

    it "create a ticket category." do
      ticket_category
      expect(TicketCategory).to have(1).records
    end

    describe "acts_as_paranoid" do
      it "destroy a ticket category." do
	expect(ticket_category.deleted_at).to be_nil
        ticket_category.destroy
	expect(ticket_category.deleted_at).not_to be_nil
      end
    end
  end

  describe "validation test" do
    context "when blank." do
      it "name is required." do
        ticket_category = build(:ticket_category_example, name: nil)
        expect(ticket_category).to have(1).errors_on(:name)
      end
    end

    context "when exceed max characters." do
      it "with name." do
        ticket_category = build(:ticket_category_example, name: "a" * (MAX_TEXT_FIELD_LENGTH + 1))
        expect(ticket_category).to have(1).errors_on(:name)
      end
    end
  end
end
