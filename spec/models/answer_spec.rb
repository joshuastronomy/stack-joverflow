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

require 'rails_helper'

RSpec.describe Answer, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
