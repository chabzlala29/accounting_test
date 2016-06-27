class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.decimal :current_balance
      t.string :name

      t.timestamps null: false
    end
  end
end
