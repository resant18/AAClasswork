class PostSub < ApplicationRecord
    # instead of validate the presence of foreign keys post_id & sub_id
    # we validate the association instead, which are post & sub.
    validates :post, :sub, presence: true
    validates :post_id, uniqueness: { scope: :sub_id }

    # doesn't need to specify the class_name and foreign key, it the name is semantic already
    belongs_to :post 
    belongs_to :sub
end
