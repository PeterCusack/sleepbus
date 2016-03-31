class Bus < ActiveRecord::Base
  has_many :trips
  # Remember to create a migration!
end
