class CreateSnacks < ActiveRecord::Migration[5.1]
  def change
    create_table :snacks do |t|
      t.string :snack_name
      t.integer :price

      t.timestamps
    end
  end
end
