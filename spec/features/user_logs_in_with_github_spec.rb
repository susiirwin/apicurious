require 'rails_helper'

describe "UserLogsInWithGithub" do

  scenario "the sign in process" do
    VCR.use_cassette("something_else") do
      visit '/'
      stub_omniauth
      click_link "Login with Github"
      expect(current_path).to eq(dashboard_index_path)
      expect(page).to have_content("natasha")
      expect(page).to have_link("Log out")
    end
  end
end
