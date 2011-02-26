class Seance < ActiveRecord::Base
  has_many :texts
  belongs_to :session
end
