require 'spec_helper'
require 'rake'

describe "set_admin" do
  before :all do
    @rake = Rake::Application.new
    Rake.application = @rake
    Rake.application.rake_require "lib/tasks/user", [Rails.root.to_s]
    Rake::Task.define_task(:environment)
  end

  describe "user:set_admin" do
    context "when execute the rake tasks." do
      subject(:user) { create(:user_example) }

      context "without the option." do
        it "display error messages." do
          Rake::Task["user:set_admin"].reenable
          expect {@rake.invoke_task "user:set_admin"}.to raise_error
        end
      end

      context "with options." do
        context "when there is no user." do
          it "display error messages." do
            Rake::Task["user:set_admin"].reenable
            ENV['USER_CODE'] = "sample"
            expect {@rake.invoke_task "user:set_admin"}.to raise_error
         end
        end

	context "when there is user." do
          before do
            Rake::Task["user:set_admin"].reenable
            ENV['USER_CODE'] = user.access_code
          end

          it "don't display error messages." do
            expect {@rake.invoke_task "user:set_admin"}.not_to raise_error
          end

          it "become the administrator." do
            @rake.invoke_task "user:set_admin"
            expect(User.where(access_code: user.access_code).first.admin).to be_true
          end
        end
      end
    end
  end
end
