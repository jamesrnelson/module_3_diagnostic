require 'rails_helper'

describe 'User' do
  context 'fills in search field and clicks locate' do
    it 'should be on /search and should see 10 closest stations with limitations' do
      visit root_path
      fill_in 'q', with: '80203'
      click_on 'Locate'

      expect(current_path).to eq('/search')
      expect(response).to be_success
      expect(page).to have_content('10 stations closest to you within 6 miles')

      stations = JSON.parse(response.body)


      expect(stations.length).to eq(10)
      expect(stations.first.distance).to be_less_than(stations.second.distance)

      stations.each do |station|
        expect(station.fuel_type).to eq('Electric' || 'Propane')
        expect(station.name).to_not eq(nil)
        expect(station.address).to_not eq(nil)
        expect(station.distance).to_not eq(nil)
        expect(station.access_times).to_not eq(nil)
      end

      # Then I should see a list of the 10 closest stations within 6 miles sorted by distance
      # And the stations should be limited to Electric and Propane
      # And for each of the stations I should see Name, Address, Fuel Types, Distance, and Access Times

    end
  end
end
