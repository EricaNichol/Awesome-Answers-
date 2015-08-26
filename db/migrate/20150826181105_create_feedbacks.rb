class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.text :body
      t.references :answer, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
