class DeputiesBecomeMembers < ActiveRecord::Migration
  def self.up
    Deputy.all.each { |d|
      m = Membership.new
      m.deputy = d
      m.start = Date.civil(2009,7,8)
      m.save!
    }
    
    # Jean Huss
    m = Membership.find_by_deputy_id(464)
    m.end = Date.civil(2011,7,6)
    m.save!
    
    # Jean-Louis Schiltz
    m = Membership.find_by_deputy_id(444)
    m.end = Date.civil(2011,3,8)
    m.save!
    
    # Mill Majerus
    m = Membership.find_by_deputy_id(437)
    m.end = Date.civil(2011,4,1)
    m.save!
    
    # Josée Lorsché
    d = Deputy.new
    d.name = "Josée Lorsché"
    d.firstname = "Josée"
    d.lastname = "Lorsché"
    d.party = Party.find(47)
    d.save!
    m = Membership.new
    m.start = Date.civil(2011,7,6)
    m.deputy = d
    m.save!
    
    # Tessy Scholtes
    d = Deputy.new
    d.name = "Tessy Scholtes"
    d.firstname = "Tessy"
    d.lastname = "Scholtes"
    d.party = Party.find(43)
    d.pc_img = "http://www.politikercheck.lu/images/abgeordnete/upload/45121/tessy_scholtes.jpg"
    d.pc_profile = "http://www.politikercheck.lu/tessy_scholtes-20533-45121.html"
    d.save!
    m = Membership.new
    m.start = Date.civil(2011,5,3)
    m.deputy = d
    m.save!
    
    # Diane Adehm
    d = Deputy.new
    d.name = "Diane Adehm"
    d.firstname = "Diane"
    d.lastname = "Adehm"
    d.party = Party.find(43)
    d.save!
    m = Membership.new
    m.start = Date.civil(2011,3,8)
    m.deputy = d
    m.save!
  end

  def self.down
  end
end
