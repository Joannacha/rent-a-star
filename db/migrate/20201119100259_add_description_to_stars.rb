class AddDescriptionToStars < ActiveRecord::Migration[6.0]
  def change
    add_column :stars, :description, :text
  end
end
