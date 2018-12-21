require 'rails_helper'

describe Machine, type: :model do
  describe 'validations' do
    it { should validate_presence_of :location }
    it { should belong_to :owner }
  end

  describe  'instance methods' do
    it ".average_price" do

    sam = Owner.create(name: "Sam's Snacks")
    machine_1 = sam.machines.create(location: "Turing Basement")
    snack_1 = Snack.create(machines: [machine_1], snack_name: "Milky Way", price: 1)
    snack_2 = Snack.create(machines: [machine_1], snack_name: "Twix", price: 3)

    expect(machine_1.average_price).to eq(2)
    end
  end 
end
