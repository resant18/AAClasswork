class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true

  has_many :submitted_urls,
    primary_key: :id,  
    foreign_key: :author_id,
    class_name: :ShortenedUrl
end