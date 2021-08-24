class CreateParties < ActiveRecord::Migration[5.2]
  def change
    create_table :parties do |t|
      t.references :host, references: :users, foreign_key: { to_table: :users }
      t.string :movie_title
      t.datetime :start_time
      t.integer :duration

      t.timestamps
    end
  end
end
