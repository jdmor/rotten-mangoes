class AddClassicToMovies < ActiveRecord::Migration
  def change
    add_column :movies, :classic, :boolean
  end
end
