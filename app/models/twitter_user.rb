class TwitterUser < User
  acts_as_paranoid

  belongs_to :parent_user, class_name: "User", foreign_key: "parent_id"

  def self.find_user(auth)
    self.where(uid: auth.uid).first
  end 

  def self.create_user(auth, current_user)
    @parent_user = current_user || User.create

    self.create(provider: auth["provider"], uid: auth["uid"],
      name: auth["info"]["name"], screen_name: auth["info"]["nickname"], image: auth["info"]["image"], parent_id: @parent_user.id)
  end 

  def update_user(auth)
    self.update_attributes(name: auth["info"]["name"], screen_name: auth["info"]["nickname"], image: auth["info"]["image"])
  end
end
