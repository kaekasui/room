class Admin::MailFormsController < ApplicationController
  def index
    @mail_forms = MailForm.all
  end
end
