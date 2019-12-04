class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.date :year
      t.string :subject
      t.integer :pages
      t.string :editorial
      t.integer :edition

      t.timestamps
    end
  end
end
