class UsersController < ApplicationController
  def show
    @repos = Repo.find_all(current_user)
  end

end
