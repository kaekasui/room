class MailFormsController < ApplicationController

  def create
    @mail_form = MailForm.new(mail_form_params)

    respond_to do |format|
      if @mail_form.save
        format.html { redirect_to blogs_path(anchor: "mail_form"), notice: I18n.t("flash.create_mail_form")}
        format.json { render json: @mail_form, status: :created, location: @mail_form }
      else
        format.html { redirect_to blogs_path(anchor: "mail_form"), notice: I18n.t("flash.cannot_create_mail_form") }
        format.json { render json: @mail_form.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  def mail_form_params
    params.require(:mail_form).permit(:title, :email, :content)
  end
end
