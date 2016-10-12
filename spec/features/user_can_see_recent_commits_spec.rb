require 'rails_helper'

describe "user views recent commits" do
  xit "returns feed of recent commits" do
    VCR.use_cassette("views recent commits") do
      visit '/'

      stub_omniauth
      click_link "Login with Github"

      expect(current_path).to eq(dashboard_index_path)
      click_link "See Your Recent Commits"
      expect(current_path).to eq(commits_path)
      expect(page).to have_content("Your Recent Commits")

      expect(page).to have_content("Adds record endpoints for merchants, transactions, and customers")
      expect(page).to have_content("https://api.github.com/repos/susiirwin/rails_engine/commits/3d12fc7851df7c589ab15d54d17634454d2237da")

    end
  end
end
