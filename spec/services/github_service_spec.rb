require 'rails_helper'

describe "GithubService" do
  xit "returns basic information about account" do
    # i need to get me from github - not sure what needs to be passed in to do that
    user = GithubService.user(filter)

    expect(user[:name]).to eq("Susi Irwin")
    expect(user[:bio]).to eq("Student at The Turing School of Software and Design")
    expect(user[:login]).to eq("susiirwin")
  end
end

# describe "SunlightService" do
#   it "filters by attributes for /legislators" do
#     # we use /legislators so that we see it is an endpoint
#     legislators = SunlightService.legislators({state: "CO"})
#     legislator = legislators.first
#
#     # we can base out expectations based on what we see in Postman
#     # - we can see the count at the bottom of the results
#     expect(legislators.count).to eq(9)
#     # - we can look at a single result and get something specific from that one
#     expect(legislator[:first_name]).to eq("Ken")
#     expect(legislator[:last_name]).to eq("Buck")
#   end
