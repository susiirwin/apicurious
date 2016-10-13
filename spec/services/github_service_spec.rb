require 'rails_helper'

describe "GithubService" do
  xit "returns basic information about account" do
    VCR.use_cassette(".find_user") do
      github_user = GithubService.find_user(:uid)

      expect(github_user[:name]).to eq("Susi Irwin")
      expect(github_user[:bio]).to eq("Student at The Turing School of Software and Design")
      expect(github_user[:login]).to eq("susiirwin")
    end
  end

  it "returns all repos" do
    VCR.use_cassette(".get_repos") do
      repos = GithubService.get_repos(ENV['USER_GITHUB_TOKEN'])
      repo = repos.first

      expect(repos.count).to eq(30)
      expect(repos.class).to eq(Array)
      expect(repo.class).to eq(Hash)
      expect(repo[:name]).to eq("rush-hour")
      expect(repo[:html_url]).to eq("https://github.com/bcgoss/rush-hour")
    end
  end

  it "returns all commits" do
    VCR.use_cassette(".get_commits") do
      stub_omniauth
      commits = GithubService.get_commits(nickname, ENV['USER_GITHUB_TOKEN'])
      commit = commits.first

      expect(commits.count).to eq(30)
      expect(commits.first[:type]).to eq ("CreateEvent")
    end
  end

end
