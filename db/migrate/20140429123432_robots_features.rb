class RobotsFeatures < ActiveRecord::Migration
  def change
    create_table :features do |t|
      t.string :name
    end

    create_table :robots do |t|
      t.string :name
    end

  	create_table :features_robots do |t|
      t.integer :robot_id
      t.integer :feature_id
    end
  end
end
