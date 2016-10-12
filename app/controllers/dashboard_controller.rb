class DashboardController < ApplicationController
  def index
    @repos = Repo.find_all(current_user)
  end
end
