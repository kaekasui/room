# encoding: utf-8
# コマンド rake user:set_admin

namespace :user do

  # 指定ユーザに管理者権限を追加する
  desc "Add administrator authority to user."
  task set_admin: :environment do
    begin
      raise "ENV['USER_CODE'] is not found." unless ENV['USER_CODE']
      code = ENV['USER_CODE']
      user = User.where(access_code: code).first
      raise "user is not found." if user.blank?
      user.admin = true
      user.save
    end
  end
end
