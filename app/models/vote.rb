class Vote < ActiveRecord::Base
  belongs_to :deputy, :class_name => "Deputy", :foreign_key => "deputy_id"
  belongs_to :delegate, :class_name => "Deputy", :foreign_key => "delegate_id"
  belongs_to :text
end
