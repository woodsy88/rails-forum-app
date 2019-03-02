# == Schema Information
#
# Table name: forum_threads
#
#  id         :bigint(8)        not null, primary key
#  subject    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#

class ForumThread < ActiveRecord::Base
  belongs_to :user
  has_many :forum_posts
  has_many :users, through: :forum_posts

  accepts_nested_attributes_for :forum_posts
  validates_associated :forum_posts
  
  validates :subject, presence: true
  
end