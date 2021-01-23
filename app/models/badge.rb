class Badge < ApplicationRecord
  belongs_to :condition

  has_many :rewardings, dependent: :destroy
  has_many :rewarded_users, through: :rewardings, source: :user
end
