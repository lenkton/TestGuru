class Badge < ApplicationRecord
  belongs_to :condition

  has_many :rewardings, dependent: :destroy
  has_many :rewarded_users, through: :rewardings, source: :user

  validates :name, uniqueness: true, presence: true
  validates :image_url, presence: true
end
