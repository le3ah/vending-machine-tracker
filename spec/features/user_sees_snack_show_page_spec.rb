require 'rails_helper'

describe 'snack show page' do
  describe 'as a visitor' do
    it "shoiuld see snack names, prices, locations, average prices, and unique itesm count" do
      sam = Owner.create(name: "Sam's Snacks")
      machine_1 = sam.machines.create(location: "Turing Basement")
      machine_2 = sam.machines.create(location: "Turing Rooftop")
      snack_1 = Snack.create(machines: [machine_1], snack_name: "Milky Way", price: 1)

      visit snack_path(snack_1)

      expect(page).to have_content(snack_1.snack_name)
      expect(page).to have_content(snack_1.price)

    end
  end
end
