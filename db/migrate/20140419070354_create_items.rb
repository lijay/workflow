class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :step_id
      t.string :summary
      t.text :description

      t.timestamps
    end
  end
end
