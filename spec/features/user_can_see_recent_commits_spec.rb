require 'rails_helper'

describe "user views recent commits" do
  it "returns feed of recent commits" do
    VCR.use_cassette("views recent commits") do
      visit '/'

      stub_omniauth
      click_link "Login with Github"

      expect(current_path).to eq(dashboard_index_path)
      click_link "See Your Recent Commits"
      expect(current_path).to eq(commits_path)
      expect(page).to have_content("Your Recent Commit History")

      expect(page).to have_content("PushEvent")

    end
  end
end
