class RenameTable < ActiveRecord::Migration
  def change
    rename_table :time_entries, :account_entries
  end
end
