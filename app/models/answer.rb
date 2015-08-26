class Answer < ActiveRecord::Base
  belongs_to :question
  has_many :feedbacks, dependent: :destroy

  validates :body, presence: {message: "Answer is required"},
                   uniqueness: {scope: :question_id} #answer body is unique
end
