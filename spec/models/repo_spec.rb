require 'rails_helper'

describe "Repo" do
  it "finds all repos" do
    VCR.use_cassette(".find_all repos") do
      user = User.create(token: ENV['USER_GITHUB_TOKEN'])
      repos = Repo.find_all(user)
      repo = repos.first
      expect(repos.count).to eq(30)
      expect(repo.name).to eq("rush-hour")
      expect(repo.url).to eq("https://github.com/bcgoss/rush-hour")
    end
  end
end
