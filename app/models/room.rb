class Room < ApplicationRecord
  has_many :room_users 
  has_many :users, dependent: destroy ,through: :room_users
end
