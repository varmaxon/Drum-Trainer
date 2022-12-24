class ChangeColumnDefaultToActions < ActiveRecord::Migration[7.0]
  def change
    change_column_default :actions, :gen_results, from: nil, to: 0
  end
end
