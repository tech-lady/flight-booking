class CreateCountries < ActiveRecord::Migration[5.1]
  def change
    create_table :countries do |t|
      t.string :name
      t.string :currency
      t.string :country_code
      t.string :exchange_rate
      t.string :iso_code

      t.timestamps
    end
  end
end
