class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :statuses

  validates :first_name, :last_name, :user_name, :email, presence: true
  validates :user_name, :email, uniqueness: true

  validates :user_name, format: {
                           with: /[a-zA-Z0-9_-]+/,
                           message: "must be formatted correctly."
                         }

  def full_name
    first_name + " " + last_name
  end

end
