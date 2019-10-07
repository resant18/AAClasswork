class Sub < ApplicationRecord
    validates :title, :description, :moderator_id, presence: true

    belongs_to :moderator,
        foreign_key: :moderator_id,
        class_name: :User
    
    has_many :post_subs, dependent: :destroy

    has_many :posts,
        through: :post_subs,
        source: :post
    
end
