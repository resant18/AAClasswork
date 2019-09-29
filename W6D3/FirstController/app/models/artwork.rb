class Artwork < ApplicationRecord
  validates :title, presence: true
  validates :image_url, presence: true
  validates :artist_id, presence: true
  validates_uniqueness_of :artist_id, scope: :title
end
