class CreateTmdbWatchmodes < ActiveRecord::Migration[6.1]
  def change
    create_table :tmdb_watchmodes do |t|
      t.integer :watchmode_id
      t.integer :tmdb_id
      t.string :tmdb_type

      t.timestamps
    end
  end
end
