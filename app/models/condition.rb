class Condition < ApplicationRecord
  has_many :badges, dependent: :destroy

  validates :name, uniqueness: true, presence: true
  validates :type, presence: true
end

# need this to use Condition.subclasses
require_dependency 'set_of_tests_solved_condition'
require_dependency 'tries_count_condition'
