class Addbootcampidtotweets < ActiveRecord::Migration
  def change
    add_column :tweets, :bootcamp_id, :integer
  end
end
