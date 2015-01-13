class AddIndexToFriendships < ActiveRecord::Migration
  def change
    add_index :user_friendships, [:user_id, :friend_id]
  end
end
