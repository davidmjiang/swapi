class AddAverageRating < ActiveRecord::Migration
  def change
    add_column :planets, :average_rating, :float
    Planet.all.each do |p|
      p.update_attributes!(:average_rating => p.average_rating)
    end
  end
end
