class Question < ActiveRecord::Base

  has_many :votes, dependent: :destroy
  has_many :voters, through: :votes, source: :user

  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings


  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :favorites


  has_many :likes, dependent: :destroy
  has_many :users, through: :likes

  has_many :answers, dependent: :destroy
  belongs_to :category
  belongs_to :user
  #has_many :answers assumes that you have a model Answer that has a reference
  # to the model (question) called question_id (Integer)
  #dependent: option is needed because we've added a foreign key constraint to our
  #database so the dependent records (in this case answers) must do something before deleting a question that they refernece. the options are: :destroy -> will delete all the answers referenceing this question before deleting the       question
  #nullify -> will make question_id field null in the database before deleting the question.

  #this prevents the record from saving or updating unless a title is provided
  validates :title, presence: {message: "must be present"},
                    #this will check for the uniqueness of the title/body
                    #combination. So title doesn't have to be unique by itself
                    #but the combination with body should.
                    uniqueness: {message: "title already exist"}, #{scope: :body}, #can add message
                    length: {minimum: 3} #makes sure title has at least 3 chars

  validates :body, presence: true

  #numericialt
  validates :view_count, presence: true,
                    numericality: {greater_than_or_equal_to: 0}

  #we use validate if we want to have a custom validation method that we can
  # have any kind of Ruby code in.
  validate :no_monkey

  after_initialize :set_defaults

  before_save :capitalize_title

  scope :recent, lambda { order(:created_at).reverse_order}
  #scope :recent, lambda { order(:created_at).reverse_order}

  #delegate :name, to: :category, prefix: true
  def votes_count
    votes.select {|v| v.up?}.count - votes.select { |v| v.down?}.count
  end

  def like_for(user)
    likes.find_by_user_id(user.id)
  end

  def favorite_for(user)
    favorites.find_by_user_id(user.id)
  end

  def user_name
    if user
      user.full_name
    else
      "Anonymous"
    end
  end

  def category_name
    category.name
  end

  def self.recent
    order(:created_at).reverse_order
  end

  def self.search(x)
    self.where(["title ILIKE ? OR body ILIKE ?", "%#{x}%", "%#{x}%"])
  end

  def self.search2(x)
     where(["title ILIKE :title OR body ILIKE :body", { title: "%#{x}%", body: "%#{x}%" }])
     #id with for : #
   end

  def self.search3(x)
     where(["title ILIKE :search_term OR body ILIKE :search_term", { search_term: "%#{x}%"}])
  end

=begin
  def self.search_multiple(words)
    query = []
    terms = []
    counter = 1
    words.split.each do |word|
      search_term = "%#{word}%"
      symbol = "search_term_#{counter}".to_sym
      query += "title ILIKE #{symbol}" OR body ILIKE #{symbol}
=end

  def self.ten
    limit(10)
  end

  private

  def no_monkey
    if title.present? && title.include?("monkey")
      # this will add to the errors object attached to the current object.
      # if the errors object is not an empty Hash then rails treats the
      # record as invalid
      errors.add(:title, "Can't have monkey!")
  end
end

  def capitalize_title
      self.title.capitalize!
      #self.title = title.capitalize
  end

  #validates :email, format: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i #regular expression
  #if you had an email attribute you can validate the forate of the attribute
  #using the 'format' option, it takes a regular expression
  #validates :email, format: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  def set_defaults
    self.view_count ||= 0
  end
end
