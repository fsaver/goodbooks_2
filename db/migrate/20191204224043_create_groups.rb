class CreateGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :groups do |t|
      t.string :name
      t.integer :user_id
      t.integer :review_access_id

      t.timestamps
    end
  end
end
