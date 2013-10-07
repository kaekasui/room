class Admin::MailFormsController < ApplicationController
  before_action :set_menu
  before_action :set_mail_form, only: [:destroy]

  def index
    @mail_forms = MailForm.all
  end

  def destroy
    @mail_form.destroy
    redirect_to admin_mail_forms_path
  end

  private

  def set_menu
    @admin_menu = "blog"
  end

  def set_mail_form
    @mail_form = MailForm.find(params[:id])
  end
end
