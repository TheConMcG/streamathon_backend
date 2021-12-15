class Service < ApplicationRecord

  has_many :service_users
  has_many :users, through: :service_users

end
