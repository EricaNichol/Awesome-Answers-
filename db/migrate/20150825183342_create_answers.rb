class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.text :body
      #this will create a integer field in the answers table named question_id
      #foreign_key: true will add Foreign Key constraint to the database
      #the index: true will add an index on the question_id field for answers
      #
      t.references :question, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
