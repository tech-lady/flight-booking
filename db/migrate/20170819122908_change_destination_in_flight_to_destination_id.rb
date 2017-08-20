class ChangeDestinationInFlightToDestinationId < ActiveRecord::Migration[5.1]
  def change
    add_column :flights, :destination_id, :integer
    remove_column :flights, :destination, :string

    add_foreign_key :flights, :airports, column: :destination_id
  end
end
