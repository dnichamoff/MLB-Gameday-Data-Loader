class Init < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string  :code,   limit: 3
      t.string  :abbrev, limit: 3
      t.string  :name
      t.string  :name_full
      t.string  :name_brief
      t.integer :division_id
      t.integer :league_id
      t.string  :league, limit: 3
      t.integer :w
      t.integer :l
    end

    create_table :stadia do |t|
      t.string :name
      t.string :venue_w_chan_loc
      t.string :location
    end
  end
end
