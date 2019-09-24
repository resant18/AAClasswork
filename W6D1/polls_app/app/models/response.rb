# == Schema Information
#
# Table name: responses
#
#  id               :integer          not null, primary key
#  question_id      :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  answer_choice_id :integer
#

class Response < ApplicationRecord
  
end
