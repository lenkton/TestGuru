class Badge < ApplicationRecord
  has_many :rewardings, dependent: :destroy
  has_many :rewarded_users, through: :rewardings, source: :user

  validates :name, uniqueness: true, presence: true
  validates :image_url, presence: true

  def grant_to(user)
    rewarded_users.push(user)
  end
end
