class Category < ApplicationRecord
  default_scope -> { order(name: :asc) }

  has_many :tests, dependent: :destroy

  validates :name, presence: true

  scope :tests_from_category_desc, ->(category) { find_by(name: category).tests.order(name: :desc) }
end
