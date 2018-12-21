class Machine < ApplicationRecord
  validates_presence_of :name

  has_many :snack_machines
  has_many :machines, through: :snack_machines
end
