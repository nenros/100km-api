class User< ActiveRecord::Base
  has_one :unit
  has_one :district, through: :unit

end