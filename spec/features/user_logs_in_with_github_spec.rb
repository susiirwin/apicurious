require 'rails_helper'

describe "UserLogsInWithGithub" do

  scenario "the sign in process" do
    VCR.use_cassette("something_else") do
      visit '/'
      stub_omniauth
      click_link "Login with Github"
      expect(current_path).to eq(user_path(User.last))
      expect(page).to have_content("Susi Irwin")
      expect(page).to have_link("Log out")
    end
  end
end
