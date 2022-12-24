class AddUserIdToActions < ActiveRecord::Migration[7.0]
  def change
    add_column :actions, :user_id, :integer
  end
end
