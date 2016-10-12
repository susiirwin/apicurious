require 'rails_helper'

describe "GitHub User" do
  context ".find_user(uid)"
  xit "returns GithubUser object" do
    github_user = GithubUser.new(GithubService.find_user(uid))

    expect(github_user[name]).to eq ("Susi Irwin")
  end
end
