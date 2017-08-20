class ChangeOriginInFlightToOriginId < ActiveRecord::Migration[5.1]
  def change
    add_column :flights, :origin_id, :integer
    remove_column :flights, :origin, :string

    add_foreign_key :flights, :airports, column: :origin_id
  end
end
