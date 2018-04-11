require 'rails_helper'

describe "Favorites Request Spec" do
  it "returns favorites for a user" do
    user = create(:user)
    create(:favorite)
    api_key = create(:api_key)
    get "/api/v1/user/favorites?api_key=#{api_key.value}"

    expect(response).to be_success

    res = JSON.parse(response.body, symbolize_names: true)

    expect(res[:id]).to eq(1)
    expect(res[:user_id]).to eq(1)
    expect(res[:asteroid]).to eq({
      "name": "153306 (2001 JL1)",
      "is_potentially_hazardous_asteroid": false,
    })
    expect(res[:neo_reference_id]).to eq(2153306)
  end
end
