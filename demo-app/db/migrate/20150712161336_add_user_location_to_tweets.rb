class AddUserLocationToTweets < ActiveRecord::Migration
  def change
    add_column :tweets, :location, :text
  end
end
