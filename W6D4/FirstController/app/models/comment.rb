# == Schema Information
#
# Table name: comments
#
#  id         :bigint           not null, primary key
#  author_id  :integer          not null
#  artwork_id :integer          not null
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Comment < ApplicationRecord
  validates :author_id, presence: true
  validates :artwork_id, presence: true

  belongs_to :author,
    foreign_key: :author_id,
    class_name: :User

  belongs_to :artwork,
    foreign_key: :artwork_id,
    class_name: :Artwork
end
