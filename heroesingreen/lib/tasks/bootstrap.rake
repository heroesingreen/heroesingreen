namespace :bootstrap_dev do
  desc "Generate all sample data"
  task :all => [:default_accounts, :default_missions, :default_plants, :default_worlds]

  desc "Reset world data"
  task :reset_worlds => [:delete_worlds, :default_worlds]

	desc "Generate default worlds"
	task :delete_worlds => :environment do
	  UnlockablePlant.destroy_all
	  WorldMission.destroy_all
	  World.destroy_all
  end

	desc "Generate default worlds"
	task :default_worlds => :environment do
	  temp_world = World.create(:name=>'Meadow World',:map_image=>'meadow_demo.gif', :description=>'Welcome to Heroes in Green! <p> Meadow world is a place of simple beauty and tranquility. Here we will take baby steps to start our heroic journey to a greener Earth. Along the way, we have many enjoyable treats and surprises for you! Watch as your efforts get turned back into carbon, which we can use to grow your very own garden! </p>')

    temp_mission = WorldMission.create(:world=>temp_world, 
                                        :name=> 'Lavender Patch', 
                                        :mission=>Mission.find(:first, :conditions=>{:title=>'Mailbox liberation'}), 
                                        :description=>'<p>Your epic journey begins here...</p>', 
                                        :required=>true,
                                        :link_css_top=>338,
                                        :link_css_left=>63,
                                        :link_css_width=>206,
                                        :link_css_padding=>191,
                                        :link_css_zindex=>51)
    
	  temp_plant = UnlockablePlant.new
	  temp_plant.plant_template = PlantTemplate.find(:first, :conditions=>{:name=>'Blackberry'})
	  temp_plant.world_mission = temp_mission
	  temp_plant.save!
	  
    temp_mission = WorldMission.create(:world=>temp_world,
                                        :name=> 'Cobblestone Path',
                                        :tag=>'home', 
                                        :description=>'<p>Take a stroll through the garden.</p>',
                                        :required=>true,
                                        :link_css_top=>467,
                                        :link_css_left=>195,
                                        :link_css_width=>232,
                                        :link_css_padding=>205,
                                        :link_css_zindex=>50)
	  
	  temp_plant = UnlockablePlant.new
	  temp_plant.plant_template = PlantTemplate.find(:first, :conditions=>{:name=>'Fern'})
	  temp_plant.world_mission = temp_mission
	  temp_plant.save!
	  
	  temp_mission = WorldMission.create(:world=>temp_world, 
                                        :name=> 'Lake Reflection', 
                                        :tag=>'water', 
                                        :description=>'<p>Let\'s stop for a bit of meditation and reflection.</p>', 
                                        :required=>true,
                                        :link_css_top=>307,
                                        :link_css_left=>299,
                                        :link_css_width=>280,
                                        :link_css_padding=>132)
    
	  temp_plant = UnlockablePlant.new
	  temp_plant.plant_template = PlantTemplate.find(:first, :conditions=>{:name=>'Cedar'})
	  temp_plant.world_mission = temp_mission
	  temp_plant.save!
	  
	  temp_mission = WorldMission.create(:world=>temp_world,
	                                    :name=> 'Puffy Clouds',
                                        :tag=>'CO2', 
                                        :description=>'<p>Saving the world is not a pie in the sky.</p>',
                                        :link_css_top=>17,
                                        :link_css_left=>206,
                                        :link_css_width=>292,
                                        :link_css_padding=>131)
	  
	  temp_plant = UnlockablePlant.new
	  temp_plant.plant_template = PlantTemplate.find(:first, :conditions=>{:name=>'Cedar'})
	  temp_plant.world_mission = temp_mission
	  temp_plant.save!
	  
	  temp_mission = WorldMission.create(:world=>temp_world,
	                                      :name=> 'Picnic',
                                        :tag=>'corn', 
                                        :description=>'<p>How about a cold refreshing drink and tasty snack?</p>',
                                        :link_css_top=>459,
                                        :link_css_left=>536,
                                        :link_css_width=>274,
                                        :link_css_padding=>149)
	  
	  temp_plant = UnlockablePlant.new
	  temp_plant.plant_template = PlantTemplate.find(:first, :conditions=>{:name=>'Cedar'})
	  temp_plant.world_mission = temp_mission
	  temp_plant.save!
	  
	  temp_mission = WorldMission.create(:world=>temp_world,
	                                      :name=> 'Sunshine',
                                        :tag=>'electricity', 
                                        :description=>'<p>Enjoy the sun while it lasts!</p>',
                                        :link_css_top=>22,
                                        :link_css_left=>708,
                                        :link_css_width=>163,
                                        :link_css_padding=>156)
	  
	  temp_plant = UnlockablePlant.new
	  temp_plant.plant_template = PlantTemplate.find(:first, :conditions=>{:name=>'Cedar'})
	  temp_plant.world_mission = temp_mission
	  temp_plant.save!
  end

	desc "Generate default accounts"
	task :default_accounts => :environment do
    User.create(:email=>'yowhan@gmail.com',:password=>'heroes',:total_points=>500,:available_points=>500,:role=>User::SECURITY_ROLES[:admin])
    User.create(:email=>'cooleycr@gmail.com',:password=>'heroes',:total_points=>500,:available_points=>500,:role=>User::SECURITY_ROLES[:admin])
    User.create(:email=>'akgrandhi@gmail.com',:password=>'heroes',:total_points=>500,:available_points=>500,:role=>User::SECURITY_ROLES[:admin])
	end
	
	desc "Generate default missions"
	task :default_missions => :environment do
	  Mission.create(:title => 'Mailbox liberation',
	                  :intro => 'Did you know that over <b>100</b> million trees are cut down to produce junk mail each year?', 
	                  :description => 'Reduce your share of the 4.5 million tons of junk mail that are sent to Americans each year.',
	                  :task => 'Go to <a href="http://www.optoutprescreen.com/">http://www.optoutprescreen.com/</a> and remove yourself from the lists of major credit card bureaus. No more preapproved credit card offers!',
	                  :reward =>'Congratulations. That probably cut out about a quarter of your junk mail. You\'ve conserved the amount of carbon in a small sapling!',
	                  :points => 500,
	                  :repeatable => Mission::ONESHOT_TYPE,
	                  :unitPoints=>100,
	                  :unit=>'Pounds of CO2',
	                  :tags=>'CO2,spam,junk,mail')
	  
   Mission.create(:title => 'Turn off the lights, turn off the lights',
                  :intro => 'Think about it - how often do you leave the lights on when you aren\'t in the room?', 
                  :description => 'Save power, reduce carbon output - all with the flick of a switch.',
                  :task => 'Turn off one light in your home.',
                  :reward =>'Leave that light off for 30 minutes and you\'ve conserved the amount of carbon in 2 daffodils.',
                  :points => 4,
                  :repeatable => Mission::ONESHOT_TYPE,
                  :unitPoints=>100,
                  :unit=>'Pounds of CO2',
                  :tags=>'CO2,light,power,home')
    
    Mission.create(:title => 'Conserve your corn!',
                   :intro => 'Did you know that if you conserved corn, we could turn it into moderately strange biofuels?', 
                   :description => 'Save corn from the evil crow demons!',
                   :task => 'Go out and rescue at least 5 ears of corn.',
                   :reward =>'Congratulations! The corn you have saved could power a lightbulb for 10 minutes!',
                   :points => 30,
                   :repeatable => Mission::REPEATABLE_TYPE,
                   :unitPoints=>50,
                   :unit=>'Corns',
                   :tags=>'corn,farm')
                   
   Mission.create(:title => 'Silent Menace',
                  :intro => 'Electronics consume power when turned off. Unplug them to save the day!', 
                  :description => 'Wasting energy is bad. Get that wattage down!',
                  :task => 'Go unplug three appliances you aren\'t using - printers, computers, microwaves!',
                  :reward =>'You\'re participating!',
                  :points => 200,
                  :repeatable => Mission::REPEATABLE_TYPE,
                  :unitPoints=>50,
                  :unit=>'Kilowatts',
                  :tags=>'electricity,watts')
	end


  desc "Generate default plant templates"
  task :default_plants => :environment do
    PlantTemplate.create(
      :name => 'Cedar',
      :cost => 100,
      :health_max => 100,
      :virility => 50,
      :layer_max => 2,
      :image_path => 'scaled-Tree1',
      :water_consumption => 20,
      :wetness_tolerance => 20,
      :wetness_optimum => 30,
      :light_min => 10,
      :light_max => 30,
      :nutrients_tolerance => 8,
      :nutrients_optimum => 8,
      :nutrients_consumption => 8,
      :vertical_rate => 8.0,
      :radial_rate => 5.0,
      :density_rate => 5.0,
	  :thumbnail => 'scaled-Tree1-thumb.png',
	  :shadow_block => 1)
  
    PlantTemplate.create(
      :name => 'Blackberry',
      :cost => 50,
      :health_max => 50,
      :virility => 50,
      :layer_max => 1,
      :image_path => 'Tree_48x48.png',
      :water_consumption => 3,
      :wetness_tolerance => 5,
      :wetness_optimum => 10,
      :light_min => 5,
      :light_max => 5,
      :nutrients_tolerance => 5,
      :nutrients_optimum => 5,
      :nutrients_consumption => 3,
      :vertical_rate => 5.0,
      :radial_rate => 5.0,
      :density_rate => 5.0,
	  :thumbnail => 'Tree_48x48.png',
	  :shadow_block => 0)
      
    PlantTemplate.create(
      :name => 'Fern',
      :cost => 10,
      :health_max => 10,
      :virility => 10,
      :layer_max => 1,
      :image_path => 'scaled-Fern',
      :water_consumption => 2,
      :wetness_tolerance => 3,
      :wetness_optimum => 8,
      :light_min => 1,
      :light_max => 3,
      :nutrients_tolerance => 2,
      :nutrients_optimum => 7,
      :nutrients_consumption => 1,
      :vertical_rate => 2.0,
      :radial_rate => 2.0,
      :density_rate => 3.0,
	  :thumbnail => 'scaled-Fern-thumb.png',
	  :shadow_block => 0)
  end
end
