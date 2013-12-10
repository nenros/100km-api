class User< ActiveRecord::Base
  include ActiveModel::Serializers::JSON
  has_secure_password
  has_one :unit
  has_one :district, through: :unit
  has_many :events, through: :unit
  
  validates :first_name, :presence => true, :length => { :minimum => 3 }
  validates :last_name, :presence => true, :length => { :minimum => 3 }
  validates :phone_number, :presence => true, :length => { :minimum => 6 }, numericality: { only_integer: true }
  validates :email, :presence => true, :uniqueness => true
  

end