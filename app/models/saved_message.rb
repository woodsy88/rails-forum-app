# == Schema Information
#
# Table name: saved_messages
#
#  id         :bigint(8)        not null, primary key
#  body       :text
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class SavedMessage < ApplicationRecord
end
