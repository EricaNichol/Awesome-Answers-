class User < ActiveRecord::Base

  has_secure_password

  has_many :questions, dependent: :nullify
  has_many :answers, dependent: :nullify

  has_many :favorites, dependent: :destroy
  has_many :favorite_questions, through: :favorites, source: :question


  has_many :likes, dependent: :destroy
  has_many :liked_questions, through: :likes, source: :question

  validates :email, presence: true,
                    uniqueness: true,
                    format: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  def full_name
    "#{first_name} #{last_name}".strip
  end

  def liked_question?(question)
    liked_questions.include?(question)
  end

  def favorite_question?(question)
    favorite_questions.include?(question)
  end

end
