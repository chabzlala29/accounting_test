class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.string :comment
      t.datetime :date

      t.timestamps null: false
    end
  end
end
