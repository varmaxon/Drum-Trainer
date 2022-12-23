class AddStatisticsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :statistics, :integer
  end
end
