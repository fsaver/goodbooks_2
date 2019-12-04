class AddReviewCountToBooks < ActiveRecord::Migration[5.1]
  def change
    add_column :books, :reviews_count, :integer
  end
end
