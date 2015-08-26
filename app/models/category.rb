class Category < ActiveRecord::Base
  # we choose :nullify because we want when a category is deleted to just
  # have the category_ID in the questions table record become null instead
  # deleting the questions.
  has_many :questions, dependent: :nullify

  validates :name, presence: true, uniqueness: true
end
