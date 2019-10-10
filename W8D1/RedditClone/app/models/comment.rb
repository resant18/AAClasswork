class Comment < ApplicationRecord
    validates :parent_comment_id, :author_id, :post_id, :content, presence: true

    belongs_to :author,
        foreign_key: :author_id,
        class_name: :User

    belongs_to :post,
        foreign_key: :post_id,
        class_name: :Post

    belongs_to :parent_comment,
        foreign_key: :parent_comment_id,
        class_name: :Comment,
        optional: true

    has_many :child_comments,
        foreign_key: :parent_comment_id,
        class_name: :Comment 

    
end
