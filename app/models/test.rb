class Test < ApplicationRecord
  belongs_to :category
  def self.from_category(category)
    Test.includes(:category).where(categories: { name: category }).distinct.pluck(:name).sort.reverse!
  end
end
