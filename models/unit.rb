class Unit < ActiveRecord::Base
  has_many :events
  belongs_to :user
  belongs_to :district

  #default_scope {where(active: true)}
  
  validates :name, :presence => true, :length => { :minimum => 3 }, :uniqueness => true
  validates :shortname, :presence => true, :length => { :minimum => 3 }, :uniqueness => true
  validates :scouts_number, :presence => true, :numericality => { only_integer: true }
  validates :city, :presence => true, :length => { :minimum => 3 }
  validates :male, :presence =>true, :inclusion => { :in => ['co', 'girl', 'boy']}
  validates :age, :presence =>true, :inclusion => { :in => ['troop', 'pack', 'multi']}
  
  def self.find_and_print(shortname)
    unit = self.find_by(shortname: shortname)
    if unit.nil?
    response = {}
    else
    puts unit
    end
    puts response
  end
  
  def self.page(page_number, limit_number=7)
    offset_number = if page_number == 1 then 0 else page_number * 10 end 
      
    self.limit(limit_number).offset(offset_number)
  end
end