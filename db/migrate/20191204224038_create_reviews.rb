class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.integer :user_id
      t.integer :book_id
      t.string :format
      t.integer :pages_read
      t.integer :rating
      t.text :review

      t.timestamps
    end
  end
end
