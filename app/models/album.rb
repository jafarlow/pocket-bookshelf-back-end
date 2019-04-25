class Album < ApplicationRecord
  validates :title, :artist, presence: true
  belongs_to :user
end
