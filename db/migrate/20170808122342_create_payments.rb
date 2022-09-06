class CreatePayments < ActiveRecord::Migration[5.1]
  def change
    create_table :payments do |t|
      t.datetime :payment_date
      t.string :transaction_ref
      t.string :payment_status

      t.timestamps
    end
  end
end
