class RemoveTweetFromTweets < ActiveRecord::Migration
  def change
    remove_column :tweets, :tweet, :text
  end
end
