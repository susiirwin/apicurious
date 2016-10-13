class GithubService

  def self.get_repos(token)
    response = Faraday.get("https://api.github.com/user/repos?access_token=#{token}")
    raw_repos = JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_commits(nickname, token)
    response = Faraday.get("https://api.github.com/users/#{nickname}/events?access_token=#{token}")
    raw_commits = JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_user(token)
    response = Faraday.get("https://api.github.com/user?access_token=#{token}")
    raw_users = JSON.parse(response.body, symbolize_names: true)
  end

end
