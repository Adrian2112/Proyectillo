class Campus < ActiveRecord::Base
  has_one :universidad
  has_many :cursoss
end
