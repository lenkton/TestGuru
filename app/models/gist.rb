class Gist < ApplicationRecord
  belongs_to :creator, class_name: :User
  belongs_to :question

  validates :hash, presence: true

  def url
    "https://gist.github.com/#{gist_hash}"
  end
end
