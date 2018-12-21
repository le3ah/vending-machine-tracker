require 'rails_helper'

describe 'snack show page' do
  describe 'as a visitor' do
    it "should see snack names, prices, locations, average prices, and unique items count" do
      sam = Owner.create(name: "Sam's Snacks")
      machine_1 = sam.machines.create(location: "Turing Basement")
      machine_2 = sam.machines.create(location: "Turing Rooftop")
      snack_1 = Snack.create(machines: [machine_1, machine_2], snack_name: "Milky Way", price: 1)

      visit snack_path(snack_1)

      expect(page).to have_content(snack_1.snack_name)
      expect(page).to have_content(snack_1.price)

      expect(page).to have_content(machine_1.location)
      expect(page).to have_content(machine_2.location)

      expect(page).to have_content("Average Price: #{machine_1.average_price}")
      expect(page).to have_content("Average Price: #{machine_2.average_price}")

    end
  end
end
