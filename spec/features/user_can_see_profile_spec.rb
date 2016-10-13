require 'rails_helper'

describe "user views see profile" do
  it "returns profile attribures" do
    VCR.use_cassette("views profile") do
      visit '/'

      stub_omniauth
      click_link "Login with Github"

      expect(current_path).to eq(user_path(User.last))
      expect(page).to have_content("natasha")
      expect(page).to have_content("NatashaTheRobot")



    end
  end
end
