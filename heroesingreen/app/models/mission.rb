class Mission < ActiveRecord::Base
  has_many :mission_statuses, :dependent => :destroy
  has_many :users, :through => :mission_statuses

  has_many :mission_tag_mappings
  has_many :mission_tags, :through => :mission_tag_mappings 
	
 attr_accessor :mission_tag_ids
 after_save :update_missions_tag

  validates_format_of :effort, :with => /\A[0-9]{2}:[0-9]{2}\z/,
    :message => "must be a time field in HH::MM format"

  validates_format_of :duration, :with => /\A[0-9]{2}:[0-9]{2}\z/,
    :message => "must be a time field in HH::MM format"

 def update_missions_tag
    unless mission_tag_ids.nil?
      self.mission_tag_mappings.each do |m|
        m.destroy unless mission_tag_ids.include?(m.mission_tag_id.to_s)
        mission_tag_ids.delete(m.mission_tag_id.to_s)
      end
      mission_tag_ids.each do |g|
        self.mission_tag_mappings.create(:mission_tag_id => g) unless g.blank?
      end
      reload
      self.mission_tag_ids = nil
    end
 end
	
# => Type information
	ONESHOT_TYPE = 0
	REPEATABLE_TYPE = 1
	EPIC_TYPE = 2
	
	MISSION_TYPE_NAMES = {
	ONESHOT_TYPE=>"Oneshot",
	REPEATABLE_TYPE=>"Repeatable",
	EPIC_TYPE=>"Epic"}
	
	def oneshot?
		self.repeatable == ONESHOT_TYPE
	end
	
	def repeatable?
		self.repeatable == REPEATABLE_TYPE
	end
	
	def epic?
		self.repeatable == EPIC_TYPE
	end
	
	def self.find_all_with_tag(tag)
	  return Mission.find(:all, :conditions=>["tags like '%%#{tag}%%'"])
  end

  def effort
    if !self[:effort].nil?
      self[:effort].to_s(:time)
    else
      self[:effort]
    end
  end

  def duration
    if !self[:effort].nil?
      self[:duration].to_s(:time)
    else
      self[:effort]
    end
  end

  # Return true if this is a timed mission, false otherwise
  def timed_mission?
    return !duration.nil?
  end

end
