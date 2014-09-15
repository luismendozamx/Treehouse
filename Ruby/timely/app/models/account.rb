class Account < ActiveRecord::Base
  has_many :account_entries

  validates :name, presence: true, 
                   length: {in: 1..70,
                            message: "Username has already been taken."},
                   uniqueness: true
end
