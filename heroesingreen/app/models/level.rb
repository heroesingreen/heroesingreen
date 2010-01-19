class Level < ActiveRecord::Base
  validates_uniqueness_of :number
  
  def get_next_level
    Level.find(:first, :conditions=>["points_required > ?",self.points_required], :order=>"points_required asc")
  end
end
