class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: :User
  has_many :questions, dependent: :destroy
  has_many :test_taking_sessions, dependent: :destroy
  has_many :test_takers, through: :test_taking_sessions, source: :user

  scope :easy, -> { where(level: [0..1]) }
  scope :medium, -> { where(level: [2..4]) }
  scope :hard, -> { where(level: [5..Float::INFINITY]) }
  scope :of_level, ->(level) { where(level: level) }

  validates :name, :level, :author, :category, presence: true
  validates :level, numiricality: { only_integer: true, greater_than: 0}

  def self.from_category(category)
    Category.tests_from_category_desc(category).pluck(:name)
  end
end
