class Repo
  attr_reader :name, :url

  def initialize(raw_repo)
    @name = raw_repo[:name]
    @url = raw_repo[:html_url]
  end

  def self.find_all(current_user)
    repos = GithubService.get_repos(current_user.token)
    repos.map do |raw_repo|
      Repo.new(raw_repo)
    end
  end
end
