# == Schema Information
#
# Table name: answers
#
#  id         :integer          not null, primary key
#  body       :text
#  user_id    :integer
#  quest_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :quest
end
