class AddUserCountToGroups < ActiveRecord::Migration[5.1]
  def change
    add_column :groups, :users_count, :integer
  end
end
