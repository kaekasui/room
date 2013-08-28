class User < ActiveRecord::Base
  # Userのサブクラスは、
  # それぞれ、find_user、update_user、create_userのメソッドを保持している。

  has_one :twitter_user, foreign_key: "parent_id"

  # omniauthの認証情報からユーザー情報を検索する
  def User.find_for_oauth(auth)
    provider_class = eval("#{auth["provider"].capitalize}User")

    user = provider_class.find_user(auth)
    user.update_user(auth) unless user.blank?
    user
  end 

  # omniauthで接続したユーザー情報を作成する
  def User.create_with_oauth(auth)
    provider_class = eval("#{auth["provider"].capitalize}User")

    user = provider_class.create_user(auth, @current_user)
    user
  end 
end
