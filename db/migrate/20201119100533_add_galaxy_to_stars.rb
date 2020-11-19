class AddGalaxyToStars < ActiveRecord::Migration[6.0]
  def change
    add_column :stars, :galaxy, :string
  end
end
