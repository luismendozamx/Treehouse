class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :statuses
  has_many :user_friendships
  has_many :friends, -> { where state: 'accepted' }, through: :user_friendships
  has_many :pending_user_friendships, -> { where state: 'pending'}, class_name: 'UserFriendship', foreign_key: :user_id
  has_many :pending_friends, through: :pending_user_friendships, source: :friend

  validates :first_name, :last_name, :user_name, :email, presence: true
  validates :user_name, :email, uniqueness: true

  validates :user_name, format: {
                           with: /[a-zA-Z0-9_-]+/,
                           message: "must be formatted correctly."
                         }

  def full_name
    first_name + " " + last_name
  end

  def to_param
    user_name
  end

end
