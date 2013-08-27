class User < ActiveRecord::Base

  # omniauthの認証情報からユーザー情報を検索する
  def self.find_for_oauth(auth)
    case auth["provider"]
    when "twitter" then find_twitter_user(auth) && update_twitter_user(auth)
    end 
  end 

  # omniauthで接続したユーザー情報を作成する
  def self.create_with_oauth(auth)
    case auth["provider"]
    when "twitter" then create_twitter_user(auth)
    end 
  end 

  private

  def self.create_twitter_user(auth)
    @user = User.create(provider: auth["provider"], uid: auth["uid"],
      name: auth["info"]["name"], screen_name: auth["info"]["nickname"], image: auth["info"]["image"])
  end 

  def self.find_twitter_user(auth)
    @user = User.where(:uid => auth.uid).first
  end 

  def self.update_twitter_user(auth)
    @user.update_attributes(name: auth["info"]["name"], screen_name: auth["info"]["nickname"], image: auth["info"]["image"])
  end 
end
