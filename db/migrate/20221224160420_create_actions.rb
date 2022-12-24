class CreateActions < ActiveRecord::Migration[7.0]
  def change
    create_table :actions do |t|
      t.integer :gen_results

      t.timestamps
    end
  end
end
