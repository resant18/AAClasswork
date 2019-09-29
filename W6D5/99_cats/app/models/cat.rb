# == Schema Information
#
# Table name: cats
#
#  id          :bigint           not null, primary key
#  birth_date  :date             not null
#  color       :string           not null
#  name        :string           not null
#  sex         :string(1)        not null
#  description :text             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'date'

class Cat < ApplicationRecord
  validates :color, inclusion: { in: %w(black white orange yellow brown) }
  validates :sex, inclusion: { in: %w(M F) }

  def age
    ((Date.today - self.birth_date) / 365).to_i
  end
end
