class Category < ApplicationRecord
  has_many :tests, dependent: :destroy

  scope :tests_from_category_desc, ->(category) { find_by(name: category).tests.order(name: :desc) }
  default_scope -> { order(name: :asc) }
end
