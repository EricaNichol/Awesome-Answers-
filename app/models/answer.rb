class Answer < ActiveRecord::Base
  belongs_to :question

  has_many :feedbacks, dependent: :destroy

  belongs_to :user

  validates :body, presence: {message: "Answer is required"},
                   uniqueness: {scope: :question_id} #answer body is unique

  def user_name
     if user
       user.full_name
     else
       "Anonymous"
     end
   end
end
