class CreateFeedbacks < ActiveRecord::Migration[7.0]
  def change
    create_table :feedbacks do |t|
      t.references :car, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.integer :rating
      t.references :booking, null: false, foreign_key: true
      t.text :content

      t.timestamps
    end
  end
end
