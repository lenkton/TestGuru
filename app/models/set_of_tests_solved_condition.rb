class SetOfTestsSolvedCondition < Condition
  has_many :test_completion_requirements, foreign_key: :condition_id, dependent: :destroy
  has_many :tests, through: :test_completion_requirements, foreign_key: :condition_id
end
