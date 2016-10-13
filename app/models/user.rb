class User < ApplicationRecord
  def self.from_omniauth(auth_info)
    user = User.find_or_create_by(uid: auth_info.uid)
    user.nickname = auth_info.info.nickname
    user.name = auth_info.info.name
    user.token = auth_info.credentials.token
    user.save!
    user
  end
end
