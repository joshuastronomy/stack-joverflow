# == Schema Information
#
# Table name: quests
#
#  id         :integer          not null, primary key
#  title      :string
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#

class Quest < ApplicationRecord
  belongs_to :user
  has_many :answers
end
