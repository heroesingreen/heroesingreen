namespace :bootstrap_dev do
  desc "Generate all sample data"
  task :all => [:default_accounts, :default_missions, :default_plants]

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
      :image_path => 'Tree_48x48.png',
      :water_consumption => 20,
      :water_min => 20,
      :water_max => 30,
      :light_min => 10,
      :light_max => 30,
      :nutrients_min => 8,
      :nutrients_max => 8,
      :nutrients_consumption => 8,
      :vertical_rate => 8.0,
      :radial_rate => 5.0,
      :density_rate => 5.0)
  
    PlantTemplate.create(
      :name => 'Blackberry',
      :cost => 50,
      :health_max => 50,
      :virility => 50,
      :layer_max => 1,
      :image_path => 'Tree_48x48.png',
      :water_consumption => 20,
      :water_min => 5,
      :water_max => 5,
      :light_min => 5,
      :light_max => 5,
      :nutrients_min => 5,
      :nutrients_max => 5,
      :nutrients_consumption => 5,
      :vertical_rate => 5.0,
      :radial_rate => 5.0,
      :density_rate => 5.0)
      
    PlantTemplate.create(
      :name => 'Fern',
      :cost => 10,
      :health_max => 10,
      :virility => 10,
      :layer_max => 0,
      :image_path => 'White_Flower_48x48.png',
      :water_consumption => 5,
      :water_min => 5,
      :water_max => 5,
      :light_min => 1,
      :light_max => 3,
      :nutrients_min => 5,
      :nutrients_max => 7,
      :nutrients_consumption => 1,
      :vertical_rate => 2.0,
      :radial_rate => 2.0,
      :density_rate => 3.0)
  end
end