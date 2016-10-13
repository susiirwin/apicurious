class UsersController < ApplicationController
  def show
    @githubuser = GithubUser.find_user(current_user)
  end

end
