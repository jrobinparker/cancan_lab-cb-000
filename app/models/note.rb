class Note < ActiveRecord::Base
  has_many :viewers
  has_many :readers, through: :viewers, source: :user
  
  accepts_nested_attributes_for :user
  
  def visible_to
    
    
  end
  
  def visible_to=()
    
  end
  
end
