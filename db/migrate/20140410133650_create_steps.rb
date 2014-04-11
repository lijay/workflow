class CreateSteps < ActiveRecord::Migration
  def change
    create_table :steps do |t|
      t.integer :project_id
      t.integer :step_no
      t.string :name
      t.string :memo
      t.boolean :finished

      t.timestamps
    end
  end
end
