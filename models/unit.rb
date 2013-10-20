class Unit < ActiveRecord::Base
  has_many :events
  belongs_to :user
  has_one :district

end