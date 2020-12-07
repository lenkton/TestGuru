class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: :User
  has_many :questions, dependent: :destroy
  has_many :test_taking_sessions, dependent: :destroy
  has_many :test_takers, through: :test_taking_sessions, source: :user

  scope :easy, -> { where(level: [0..1]) }
  scope :medium, -> { where(level: [2..4]) }
  scope :hard, -> { where(level: [5..Float::INFINITY]) }

  def self.from_category(category)
    Category.find_by(name: category).tests.order(name: :desc).pluck(:name)
  end
end
