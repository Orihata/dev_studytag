class AddColumnsToGenre < ActiveRecord::Migration[5.2]
  def change
    add_column :genres, :color, :string
    add_column :genres, :logo, :string    
  end
end