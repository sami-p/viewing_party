class AddMovieRuntimeToParties < ActiveRecord::Migration[5.2]
  def change
    add_column :parties, :movie_runtime, :integer
  end
end
