class AddLocationToTweets < ActiveRecord::Migration
  def change
    add_column :tweets, :tweet, :text
  end
end
