class AddEmailAddress < ActiveRecord::Migration
  def up
    add_column :customers, :email, :string
  end

  def down
  	add_column :customers, :email
  end
end