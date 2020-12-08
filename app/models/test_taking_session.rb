class TestTakingSession < ApplicationRecord
  belongs_to :test
  belongs_to :user

  validates :user, :test, presence: true
end
