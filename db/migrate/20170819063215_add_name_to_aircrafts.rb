class AddNameToAircrafts < ActiveRecord::Migration[5.1]
  def change
    add_column :aircrafts, :name, :string
  end
end
