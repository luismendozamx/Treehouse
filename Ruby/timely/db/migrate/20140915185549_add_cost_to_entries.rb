class AddCostToEntries < ActiveRecord::Migration
  def change
    add_column :account_entries, :amount, :decimal
    add_column :accounts, :balance, :decimal
  end
end
