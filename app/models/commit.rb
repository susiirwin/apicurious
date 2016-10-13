class Commit
  attr_reader :id, :type

  def initialize(raw_commit)
    @id = raw_commit[:id]
    @type = raw_commit[:type]
  end

  def self.find_all(current_user)
    commits = GithubService.get_commits(current_user.nickname, current_user.token)
    # require 'pry'; binding.pry
    # commits are only in PushEvent which is a Type of Event
    commits.map do |raw_commit|
      Commit.new(raw_commit)
    end
  end



end
