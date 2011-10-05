class Universidad < ActiveRecord::Base
  has_many :campus
  has_one :user
end
