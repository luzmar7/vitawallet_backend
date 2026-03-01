class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.references :user, null: false, foreign_key: true
      t.string :from_currency, null: false
      t.string :to_currency, null: false
      t.decimal :from_amount, precision: 20, scale: 8, null: false
      t.decimal :to_amount, precision: 20, scale: 8
      t.integer :status, default: 0, null: false

      t.timestamps
    end

    add_index :transactions, :status
  end
end