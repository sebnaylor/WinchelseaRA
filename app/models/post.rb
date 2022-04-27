class Post < ApplicationRecord
  belongs_to :user
  has_many :votes, dependent: :destroy
  validates :user, presence: true
end
