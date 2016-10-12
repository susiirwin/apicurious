class GithubService
  def self.get_repos(token)
    response = Faraday.get("https://api.github.com/user/repos?access_token=#{token}")
    raw_repos = JSON.parse(response.body, symbolize_names: true)
  end

end
