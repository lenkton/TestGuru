class Test < ApplicationRecord
  def self.from_category(category)
    Test.joins('JOIN categories ON tests.category_id = categories.id')
        .where(categories: { name: category }).order(name: :desc).pluck(:name)
  end
end
