# == Schema Information
#
# Table name: universidades
#
#  id         :integer(4)      not null, primary key
#  nombre     :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Universidad < ActiveRecord::Base
  has_many :campus
end
