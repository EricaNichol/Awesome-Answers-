class Comment < ActiveRecord::Base

  belongs_to :product

  validates :body, presence: {message: "Comment is required"},
                   uniqueness: {scope: :product_id}

  
end
