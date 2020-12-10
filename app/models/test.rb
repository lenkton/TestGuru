class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: :User

  has_many :questions, dependent: :destroy
  has_many :test_taking_sessions, dependent: :destroy
  has_many :test_takers, through: :test_taking_sessions, source: :user

  validates :name, :level, presence: true
  validates :level, numericality: { only_integer: true, greater_than: 0 }
  validates :name, uniqueness: { scope: :level, message: 'Тест с таким уровнем и именем уже существует' }

  scope :easy, -> { where(level: [0..1]) }
  scope :medium, -> { where(level: [2..4]) }
  scope :hard, -> { where(level: [5..Float::INFINITY]) }
  scope :of_level, ->(level) { where(level: level) }

  scope :of_category, ->(category) { joins(:category).where(categories: { name: category }).order(name: :desc) }

  def self.from_category(category)
    Test.of_category(category).pluck(:name)
  end
end
