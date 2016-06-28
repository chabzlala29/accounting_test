class AddTypeToPosting < ActiveRecord::Migration
  def change
    add_column :postings, :status, :integer
  end
end
