class Notifier < ActionMailer::Base
  default from: "noreply@example.com"

  # ブログ作成時に、作成した管理者のメールアドレスに通知する。
  def create_blog
    @greeting = "Hi"

    mail to: "aquariuslake@gmail.com"
  end
end
