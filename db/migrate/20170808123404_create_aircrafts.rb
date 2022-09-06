class CreateAircrafts < ActiveRecord::Migration[5.1]
  def change
    create_table :aircrafts do |t|
      t.string :tail_number
      t.integer :first_class_capacity
      t.integer :business_class_capacity
      t.integer :economy_class_capacity

      t.timestamps
    end
  end
end
