class AddIndexToActions < ActiveRecord::Migration[7.0]
  def change
    add_index :actions, :id
  end
end
