class CommitsController < ApplicationController
  def index
    @commits = Commit.find_all(current_user)
  end
end
