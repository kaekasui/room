class Admin::MailFormsController < ApplicationController
  before_action :set_menu

  def index
    @mail_forms = MailForm.all
  end

  private

  def set_menu
    @admin_menu = "blog"
  end
end
