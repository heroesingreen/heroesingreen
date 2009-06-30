class MissionStatus < ActiveRecord::Base
  belongs_to :user
  belongs_to :mission
  attr_reader :status
  ACTIVATED_STATUS = 1
  COMPLETED_STATUS = 2
  
  def activate
    @status = ACTIVATED_STATUS
  end
  
  def activated?
    @status == ACTIVATED_STATUS
  end
  
  def complete
    @status = COMPLETED_STATUS
  end
  
  def completed?
    @status == COMPLETED_STATUS
  end
#  def status
#    @mission_status.status
#  end
end
