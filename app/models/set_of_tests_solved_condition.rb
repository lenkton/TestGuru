class SetOfTestsSolvedCondition < Condition
  has_many :test_completion_requirements, foreign_key: :condition_id, dependent: :destroy
  has_many :required_tests, through: :test_completion_requirements, foreign_key: :condition_id, source: :test
end
