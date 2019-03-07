# == Schema Information
#
# Table name: tweets
#
#  id         :bigint(8)        not null, primary key
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  tweet_id   :integer
#  user_id    :integer
#

class Tweet < ApplicationRecord
  belongs_to :user
  belongs_to :tweet, optional: true

  def tweet_type
    if tweet_id? && body?
      "quote_tweet"
    elsif tweet_id?
      "retweet"
    else
      "tweet"
    end
  end

end
