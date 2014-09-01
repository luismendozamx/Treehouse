class AccountEntries < ActiveRecord::Migration
  def change
    add_column :time_entries, :acount_id, :integer
    rename_table :time_entries, :account_entries
  end
end
