class GithubUser
  attr_reader :name,
              :login_name,
              :profile_pic,
              :bio,
              :email,
              :blog,
              :number_following,
              :number_of_followers

  def initialize(raw_user)
    @name                = raw_user[:name]
    @login_name          = raw_user[:login]
    @profile_pic         = raw_user[:avatar_url]
    @bio                 = raw_user[:bio]
    @email               = raw_user[:email]
    @blog                = raw_user[:blog]
    @number_of_followers = raw_user[:followers]
    @number_following    = raw_user[:following]
  end

  def self.find_user(current_user)
    raw_user = GithubService.get_user(current_user.token)
    GithubUser.new(raw_user)
  end
end
