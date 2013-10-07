class Druzyna < ActiveRecord::Base
  has_many :wycieczki
  belongs_to :uzytkownik

end