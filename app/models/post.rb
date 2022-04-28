class Post < ApplicationRecord
  belongs_to :user
  has_many :votes, dependent: :destroy
  has_many :comments, dependent: :destroy
  validates :user, presence: true
end
