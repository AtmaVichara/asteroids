require 'rails_helper'

describe "Favorites Request Spec" do
  it "returns favorites for a user" do
    user = create(:user)
    create(:favorite)
    api_key = create(:api_key)
    get "/api/v1/user/favorites?api_key=#{api_key.value}"

    expect(response).to be_success

    res = JSON.parse(response.body, symbolize_names: true)

    expect(res.first[:asteroid]).to eq({
      name: "153306 (2001 JL1)",
      is_potentially_hazardous_asteroid: false,
    })
    expect(res.first[:neo_reference_id]).to eq("2153306")
  end

  it "can post to favorites" do
    user = create(:user)
    api_key = create(:api_key)
    post "/api/v1/user/favorites?api_key=#{api_key.value}&neo_reference_id=2021277"

    expect(response).to be_success

    res = JSON.parse(response.body, symbolize_names: true)

    expect(res.first[:asteroid]).to eq({
      name: "21277 (1996 TO5)",
      is_potentially_hazardous_asteroid: false,
    })
    expect(res.first[:neo_reference_id]).to eq("2021277")
  end
end
