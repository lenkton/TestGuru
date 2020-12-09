class Category < ApplicationRecord
  default_scope -> { order(name: :asc) }

  scope :tests_from_category_desc, ->(category) { find_by(name: category).tests.order(name: :desc) }

  has_many :tests, dependent: :destroy

  validates :name, presence: true
end
