class CreateAccounts < ActiveRecord::Migration[6.1]
  def change
    create_table :accounts do |t|
      t.string :name, null: false
      t.string :cpf, null: false
      t.string :rg, null: false
      t.date :dt_nasc, null: false
      t.float :balance
      t.string :password, null: false

      t.timestamps
    end
  end
end
