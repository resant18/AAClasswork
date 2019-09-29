require 'securerandom'

class ShortenedUrl < ApplicationRecord
  include SecureRandom

  validates :long_url, presence: true 
  validates :short_url, presence: true, uniqueness: true

  def self.random_code
     
    x = SecureRandom.urlsafe_base64
    while self.exists?(x)
      x = SecureRandom.urlsafe_base64
    end
    x
  end

end
