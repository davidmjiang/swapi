class CreatePlanets < ActiveRecord::Migration
  def change
    create_table :planets do |t|
      t.string :name
      t.string :population
      t.string :climate
      t.string :terrain
      t.timestamps null: false
    end
  end
end
