class Album < ApplicationRecord
  validates :title, :artist, presence: true
end
