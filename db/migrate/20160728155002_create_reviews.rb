class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :author_name
      t.text :body
      t.integer :rating
      t.references :planet
      t.timestamps null: false
    end
  end
end
