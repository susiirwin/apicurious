require 'rails_helper'

describe "user views repos" do
  it "returns repos" do
    VCR.use_cassette("view_repos") do
      visit '/'

      expect(page).to_not have_content("Repos")
      stub_omniauth
      click_link "Login with Github"

      expect(current_path).to eq(dashboard_index_path)
      expect(page).to have_content("Your Repos")

      expect(page).to have_content("rush-hour")
      expect(page).to have_content("https://github.com/bcgoss/rush-hour")
    end
  end
end
