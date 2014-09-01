class RenameColumn < ActiveRecord::Migration
  def change
    rename_column :account_entries, :acount_id, :account_id
  end
end
