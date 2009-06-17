class AddTestData < ActiveRecord::Migration
  def self.up
    Mission.create(:title => 'Mailbox liberation',
    :intro => 'Did you know that over 100 million trees are cut down to produce junk mail each year?',
    :description => 'Reduce your share of the 4.5 million tons of junk mail that are sent to Americans each year.',
    :task => 'Go to http://www.optoutprescreen.com/ and remove yourself from the lists of major credit card bureaus. No more preapproved credit card offers!',
    :reward => 'Congratulations. That probably cut out about a quarter of your junk mail. You\'ve conserved the amount of carbon in a small sapling!',
    :points => 500,
    :type => 1,
    :unitPoints => 100,
    :unit => 'Pounds of CO2')
    
    Mission.create(:title => 'Turn off the lights, turn off the lights',
    :intro => 'Think about it - how often do you leave the lights on when you aren\'t in the room?',
    :description => 'Save power, reduce carbon output - all with the flick of a switch.',
    :task => 'Turn off one light in your home.',
    :reward => 'Congratulations. Just by switching off one light, you\'ve made a difference! Leave that light off for 30 minutes and you\'ve conserved the amount of carbon in 2 daffodils.',
    :points => 4,
    :type => 1,
    :unitPoints => 100,
    :unit => 'Pounds of CO2')
    
    User.create(:email => 'heroesingreen@gmail.com',
    :password => 'password',
    :total_points => 0)
    

  end
    Mission.delete_all
    User.delete_all
  def self.down
  end
end
