class CreatePostings < ActiveRecord::Migration
  def change
    create_table :postings do |t|
      t.references :account, index: true, foreign_key: true
      t.decimal :amount
      t.references :transaction, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
