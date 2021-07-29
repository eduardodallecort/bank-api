class CreateTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :transactions do |t|
      t.string :transaction_type, null: false
      t.float :value, null: false
      t.date :transaction_date, null: false
      t.references :account, null: false, foreign_key: true
      t.float :previous_balance
      t.float :new_balance

      t.timestamps
    end
  end
end
