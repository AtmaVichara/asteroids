require 'rails_helper'

describe "as a user" do
  context "from root path" do
    describe "when I choose a date range and click submit" do
      it "will display the day with the most potentially dangerous objects" do
        visit root_path

        fill_in 'start_date', with: '1 Jan 2018'
        fill_in 'end_date', with: '7 Jan 2018'
        click_on "Determine Most Dangerous Day"

        expect(current_path).to eq('/most_dangerous_day')
        # expect(page).to have_content("January 1, 2018 - January 7, 2018")
        expect(page).to have_content("January 1, 2018")
        expect(page).to have_content("Name: (2014 KT76)")
        expect(page).to have_content("NEO Reference ID: 3672906")
        expect(page).to have_content("Name: (2001 LD)")
        expect(page).to have_content("NEO Reference ID: 3078262")
        expect(page).to have_content("Name: (2017 YR1)")
        expect(page).to have_content("NEO Reference ID: 3794979")
      end
    end
  end
end
