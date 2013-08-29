class Notifier < ActionMailer::Base
  default :from => "noreply@example.com"

  def signup_email
    mail( :to => "aquariuslake@gmail.com", :subject => "ご登録ありがとうございます")
  end
end
