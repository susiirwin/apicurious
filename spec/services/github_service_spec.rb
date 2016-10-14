require 'rails_helper'

describe "GithubService" do
  it "returns basic information about account" do
    VCR.use_cassette(".find_user") do

      github_user = GithubService.get_user(uid)

      expect(github_user).to have_key(:name)
      expect(github_user).to have_key(:bio)
      expect(github_user).to have_key(:login)
      expect(github_user[:name].class).to eq(string)
      expect(github_user[:bio].class).to eq(string)
      expect(github_user[:login].class).to eq(string)
    end
  end

  it "returns all repos" do
    VCR.use_cassette(".get_repos") do
      repos = GithubService.get_repos(ENV['USER_GITHUB_TOKEN'])
      repo = repos.first

      expect(repos.count).to eq(30)
      expect(repos.class).to eq(Array)
      expect(repo.class).to eq(Hash)
      expect(repo[:name].class).to eq(string)
      expect(repo[:html_url].class).to eq(string)
    end
  end

  it "returns all commits" do
    VCR.use_cassette(".get_commits") do
      commits = GithubService.get_commits(nickname, ENV['USER_GITHUB_TOKEN'])
      commit = commits.first

      expect(commits.count).to eq(30)
      expect(commits.first[:type]).to eq ("CreateEvent")
    end
  end

end
