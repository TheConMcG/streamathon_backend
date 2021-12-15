class User < ApplicationRecord
  
  has_secure_password
  validates :email, presence: true, uniqueness: true

  has_many :service_users
  has_many :services, through: :service_users
  
end
