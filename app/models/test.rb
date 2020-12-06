class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: :User
  has_many :questions
  has_many :test_taking_sessions
  has_many :test_takers, through: :test_taking_sessions, source: :user

  def self.from_category(category)
    Test.joins('JOIN categories ON tests.category_id = categories.id')
        .where(categories: { name: category }).order(name: :desc).pluck(:name)
  end
end
