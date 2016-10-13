require 'rails_helper'

describe "user views repos" do
  it "returns repos" do
    VCR.use_cassette("view_repos") do
      visit '/'

      expect(page).to_not have_content("Repos")
      stub_omniauth
      click_link "Login with Github"

      expect(current_path).to eq(user_path(User.last))
      expect(page).to have_content("Welcome to SusiHub!")
      click_link "View Your Repos"
      expect(current_path).to eq(repos_path)

      expect(page).to have_content("https://github.com/bcgoss/rush-hour")
    end
  end
end
