class Post < ApplicationRecord
    validates :title, :author, presence: true    

    belongs_to :author,
        foreign_key: :author_id,
        class_name: :User

    # inverse_of is added here so when post is created, the association
    # is added to post_subs, even though post.id is nil
    has_many :post_subs, dependent: :destroy, inverse_of: :post

    has_many :subs,
        through: :post_subs,
        source: :sub
end
