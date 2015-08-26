class Product < ActiveRecord::Base

  validates :title, presence: {message: "Needs a Title"},
                    uniqueness: {message: "title already exist"}

  validates :price, numericality: {greater_than: 0}

  has_many :comments,dependent: :destroy


end
