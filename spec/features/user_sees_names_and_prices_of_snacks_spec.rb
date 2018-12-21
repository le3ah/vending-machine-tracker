require 'rails_helper'

describe  'vending machine show page' do
  it "should see all snacks with name and price" do
    sam = Owner.create(name: "Sam's Snacks")
    machine_1 = sam.machines.create(location: "Turing Basement")
    snack_1 = Snack.create(machines: [machine_1], snack_name: "Milky Way", price: 1)
    snack_1 = Snack.create(machines: [machine_1], snack_name: "Twix", price: 2)
    visit machine_path(machine_1)

    expect(page).to have_content(snack_1.snack_name)
    expect(page).to have_content(snack_1.price)
    expect(page).to have_content(snack_2.snack_name)
    expect(page).to have_content(snack_2.price)

  end
end
