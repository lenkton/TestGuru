class TriesCountCondition < Condition
  # needs addiitonal field in the db
  validates :tries_count, presence: true

end
