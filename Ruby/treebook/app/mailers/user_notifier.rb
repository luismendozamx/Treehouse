class UserNotifier < ActionMailer::Base
  default from: "from@example.com"

  def friend_requested(user_friendship_id)
    user_friendship = UserFriendship.find(user_friendship_id)

    @user = user_friendship.user
    @friend = user_friendship.friend

    mail to: @friend.email
         subject: "#{@user.full_name} wants to be friends on Treebok"
  end

  def friend_accepted(user_friendship_id)
    user_friendship = UserFriendship.find(user_friendship_id)

    @user = user_friendship.user
    @friend = user_friendship.friend

    mail to: @user.email
         subject: "#{@friend.full_name} has accepted your request"
  end

end
