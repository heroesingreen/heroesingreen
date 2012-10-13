PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
DROP TABLE IF EXISTS 'missions';
CREATE TABLE `missions` (`id` integer PRIMARY KEY AUTOINCREMENT, `title` varchar(255), `intro` varchar(255), `description` varchar(255), `task` varchar(255), `reward` varchar(255), `points` integer, `repeatable` integer, `unitPoints` double precision, `unit` varchar(255), `created_at` timestamp, `updated_at` timestamp, `tags` varchar(255), `duration` time, `effort` time, `cost` numeric(10, 0));
INSERT INTO "missions" VALUES(1,'Mailbox liberation','Did you know that over <b>100</b> million trees are cut down to produce junk mail each year?','Reduce your share of the 4.5 million tons of junk mail that are sent to Americans each year.','Go to <a href="http://www.optoutprescreen.com/">http://www.optoutprescreen.com/</a> and remove yourself from the lists of major credit card bureaus. No more preapproved credit card offers!','Congratulations. That probably cut out about a quarter of your junk mail. You''ve conserved the amount of carbon in a small sapling!',395,0,39.0,'Pounds of CO2','2012-02-01 07:08:57.000000+0000','2012-09-22 21:10:25.000000+0000','CO2,spam,junk,mail','2012-10-13 00:15:00.000000-0700','2012-10-13 00:15:00.000000-0700',0);
INSERT INTO "missions" VALUES(2,'Turn off the lights, turn off the lights','Think about it - how often do you leave the lights on when you aren''t in the room?','Save power, reduce carbon output - all with the flick of a switch.','Turn off one light in your home.','Leave that light off for 30 minutes and you''ve conserved the amount of carbon in 2 daffodils.',4,0,0.4,'Pounds of CO2','2012-02-01 07:08:57.000000+0000','2012-09-22 21:35:51.000000+0000','CO2,light,power,home','2012-10-13 00:00:00.000000-0700','2012-10-13 00:00:00.000000-0700',NULL);
INSERT INTO "missions" VALUES(4,'Silent Menace','Electronics consume power when turned off. Unplug them to save the day!','Did you know that electronic appliances like televisions use power even when they’re not on? It’s easy not to realize it, but even when off these things still use a small amount of power. Unplugging 3 appliances for 10 hours even once is a small savings, ','Go unplug three appliances you aren''t using, just for one day - printers, computers, microwaves!','A mission like this is best done regularly, and the Phantom Power 2 challenge can help make it a habit!',5,1,0.3,'Kilowatts','2012-02-01 07:08:57.000000+0000','2012-09-23 00:17:48.000000+0000','electricity,watts','2012-10-13 23:00:00.000000-0700','2012-10-13 00:00:00.000000-0700',0);
INSERT INTO "missions" VALUES(5,'Hot Pipes','Uninsulated pipes waste time, money, and energy!','Pipe insulation is cheap and requires no tools to install.  You''ll save time waiting for tap water to get hot, and save money, too!','Insulate the first 3 feet of your hot and cold water pipes.','You''re a winner!',455,0,45.0,'CO2 lbs','2012-09-22 22:02:34.000000+0000','2012-09-22 22:02:34.000000+0000',NULL,'2012-10-13 01:30:00.000000-0700','2012-10-13 01:30:00.000000-0700',NULL);
INSERT INTO "missions" VALUES(6,'Air Dry','Drying machines are huge energy hogs!  Cut down on carbon by letting your clothes air dry.','Electric and gas clothing dryers use a lot of energy.  If you''re not in a hurry, line drying your clothes can save you money and carbon - maybe even hassle at the laundromat!','Hang your clothes to dry on a clothesline or drying rack, instead of the drying machine!','What a star!  Keep it up!',600,1,60.0,'CO2 lbs','2012-09-22 22:08:02.000000+0000','2012-09-23 00:07:05.000000+0000',NULL,'2012-10-13 08:00:00.000000-0700','2012-10-13 08:00:00.000000-0700',NULL);
INSERT INTO "missions" VALUES(7,'Air Dry All Summer Long!','Drying machines are huge energy hogs! Cut down on carbon by letting your clothes air dry.','Electric and gas clothing dryers use a lot of energy. If you''re not in a hurry, line drying your clothes can save you money and carbon - maybe even hassle at the laundromat!','Line dry your clothes for a whole summer!','You''re a real champ!',6700,1,662.0,'lbs CO2','2012-09-22 22:09:50.000000+0000','2012-09-22 22:11:20.000000+0000',NULL,'2012-10-13 08:00:00.000000-0700','2012-10-13 08:00:00.000000-0700',0);
INSERT INTO "missions" VALUES(8,'Green Power!','Many utilities offer "green" electricity programs.','Buying wind, solar, or other renewable power from your electric company can add to your monthly bill, but it lets companies know there''s demand for clean energy! One year in a green power program saves a huge amount of carbon!','Sign up for 100 KWh of green power per month with your local utility company!','Repeat this mission as you buy more green power credits!',16800,0,1660.0,'lbs CO2','2012-09-22 22:25:40.000000+0000','2012-09-22 22:26:29.000000+0000',NULL,'2012-10-13 00:00:00.000000-0700','2012-10-13 00:00:00.000000-0700',24);
INSERT INTO "missions" VALUES(9,'Drive with friends!','Carpool to work today!','Carpooling can be a great way to cut down on how much gasoline you use! Save money on gas and parking!','Carpool to and from work - just once!','Good job - try carpooling for a whole month!',200,1,1.0,'gallon of gasoline','2012-09-22 22:32:34.000000+0000','2012-09-23 00:05:13.000000+0000',NULL,'2012-10-13 00:30:00.000000-0700','2012-10-13 00:30:00.000000-0700',-3);
INSERT INTO "missions" VALUES(10,'Drive with Friends 2','You''ve carpooled once - keep it up!','Carpool for a month to save more gas, more money, and more carbon!','Carpool each weekday for one month.','Great!  Be sure to repeat this mission each month!',4925,1,25.0,'gallons of gasoline','2012-09-22 22:36:10.000000+0000','2012-09-22 22:36:10.000000+0000',NULL,'2012-10-13 12:00:00.000000-0700','2012-10-13 00:30:00.000000-0700',-95);
INSERT INTO "missions" VALUES(11,'CFL FTW','Install 2 CFL light bulbs.','Replacing old light bulbs with compact fluorescent light bulbs (CFLs) is an easy way to save energy. They last up to 10 times longer  and, because they use less energy, over a year two CFLs will save about $15 to $20.','Replace 2 old light bulbs with CFLs.','Great! Repeat this mission as you replace more lights.',2725,1,175.0,'Kilowatt Hours','2012-09-22 22:45:38.000000+0000','2012-09-22 22:45:38.000000+0000',NULL,'2012-10-13 00:00:00.000000-0700','2012-10-13 00:15:00.000000-0700',-15);
INSERT INTO "missions" VALUES(12,'Check Your Wheels','Leaky car tires will lower your gas mileage!','Check your tire pressure and top up your wheels to keep your car running efficiently. This is easy to do at home with the right tools, or at most gas stations. You could save over $100 a year on gas!','Check your car''s tires with a pressure gauge and inflate to the recommended pressure!','Keep it up! Be sure to repeat this every 3 months!',2030,1,10.3,'gallons of gasoline','2012-09-22 22:51:15.000000+0000','2012-09-22 22:51:15.000000+0000',NULL,'2012-10-13 00:00:00.000000-0700','2012-10-13 00:30:00.000000-0700',-39);
INSERT INTO "missions" VALUES(13,'A Cold Wash','Washing clothes in hot or warm water is usually unnecessary.','If you wash your clothes in hot or warm water, try setting your washer to "cold" for your next load of laundry.  Heating water takes a lot of energy, so you''ll save on your energy bill, and reduce your carbon footprint!','Wash one load of laundry on cold, instead of with hot water.','Way to go!  Make a habit of this with another mission!',40,1,4.0,'lbs CO2','2012-09-22 22:58:46.000000+0000','2012-09-22 22:58:46.000000+0000',NULL,'2012-10-13 00:00:00.000000-0700','2012-10-13 00:00:00.000000-0700',0);
INSERT INTO "missions" VALUES(14,'Cold Laundry All Month!','','If you wash your clothes in hot or warm water, try setting your washer to "cold" for each load of laundry this month. Heating water takes a lot of energy, so you''ll save on your energy bill, and reduce your carbon footprint!','For a month, run your washing machine with cold water.','What a star!  Keep it up!',660,1,42.0,'Kilowatt Hours','2012-09-22 23:02:22.000000+0000','2012-09-22 23:02:22.000000+0000',NULL,'2012-10-13 00:00:00.000000-0700','2012-10-13 00:00:00.000000-0700',-5);
INSERT INTO "missions" VALUES(15,'Take the Bus!','Take the bus to work this week.','This mission requires some planning!  Most public transit services have information about schedules, routes and fares available online. Many even have trip planning features to help you find the right routes. Riding the bus can give you a chance to read, ','Commute to and from work or school by bus every day for a week.','Great! Keep it up and repeat this mission!',345,1,34.0,'lbs CO2','2012-09-22 23:06:30.000000+0000','2012-09-22 23:06:30.000000+0000',NULL,'2012-10-13 00:00:00.000000-0700','2012-10-13 00:30:00.000000-0700',NULL);
INSERT INTO "missions" VALUES(16,'Ride Your Bike!','Ride your bicycle to work this week.','You may need to take time to plan out a safe route ahead of time. There are websites to help plan routes and give advice for getting started with commuting by bicycle. In addition to saving gas and money, riding a bike is great exercise!

Bicycling not ','Commute to and from work or school by bicycle every day for a week. ','Great! Keep it up and repeat this mission!',350,1,35.0,'lbs CO2','2012-09-22 23:09:49.000000+0000','2012-09-22 23:09:49.000000+0000',NULL,'2012-10-13 00:00:00.000000-0700','2012-10-13 01:00:00.000000-0700',NULL);
INSERT INTO "missions" VALUES(17,'Cool it!','Turn your thermostat down 4 degrees this week.','Nearly a third of the energy used by the average household is for heating. Even a small change to the can make a big difference in how much energy you use. Just one week at a lower temperature can save about $6.86. Over the course of a month, it could sav','During the cool season, turn your thermostat down by 4 degrees for a week.','Way to go!  Make a habit of this with another mission!',945,1,94.0,'lbs CO2','2012-09-22 23:14:14.000000+0000','2012-09-22 23:14:14.000000+0000',NULL,'2012-10-13 00:00:00.000000-0700','2012-10-13 00:15:00.000000-0700',-7);
INSERT INTO "missions" VALUES(18,'Cool it - all winter!','Put on a sweater and turn your thermostat down 4 degrees this winter.','Nearly a third of the energy used by the average household is for heating. Even a small change to the can make a big difference in how much energy you use. Over the entire winter, this could save you an average of $155!','Turn your thermostat down 4 degrees this winter.','Brr-iliant!',20510,1,2030.0,'lbs CO2','2012-09-22 23:17:24.000000+0000','2012-09-22 23:17:24.000000+0000',NULL,'2012-10-13 00:00:00.000000-0700','2012-10-13 00:15:00.000000-0700',-155);
INSERT INTO "missions" VALUES(19,'Turn it up!','Turn your thermostat up 4 degrees this week.','In the average household, about 17% of the energy use goes to cooling.  Turning the thermostat up 4 degrees when air conditioning is being used saves about $2.65 a week.','If you have central AC, turn your thermostat up 4 degrees (F) for a week during the summer.','Way to go!  Make a habit of this with another mission!',350,1,34.0,'lbs CO2','2012-09-22 23:21:32.000000+0000','2012-09-22 23:21:32.000000+0000',NULL,'2012-10-13 00:00:00.000000-0700','2012-10-13 00:15:00.000000-0700',-2);
INSERT INTO "missions" VALUES(20,'Turn it up - all summer!','This summer, turn your thermostat up by 4 degrees.','This is an easy mission.  If you have central air, just turn your thermostat 4 degrees higher than normal and keep it that way all summer. Try limiting the heat by closing curtains to block direct sunlight, or cool down with a cold drink. You could save o','If your house has central AC, turn your thermostat up 4 degrees (F) this summer.','Way to go!  Be sure to repeat this next year.',4560,1,450.0,'lbs CO2','2012-09-22 23:26:14.000000+0000','2012-09-22 23:26:14.000000+0000',NULL,'2012-10-13 00:00:00.000000-0700','2012-10-13 00:15:00.000000-0700',-34);
INSERT INTO "missions" VALUES(21,'Recycled Ream','When you buy paper, buy recycled!','Even in this electronic age, we all still use paper.  Most of us have a printer at home, or take notes by hand on occasion.  In fact, while most of it isn’t at home, each of us now uses more paper than ever before! Buy recycled to save trees, and cut down','The next time you buy a ream (500 pages) of copy paper, buy recycled!','Great! Keep it up and repeat this mission!',70,1,6.75,'lbs CO2','2012-09-22 23:51:56.000000+0000','2012-09-22 23:51:56.000000+0000',NULL,'2012-10-13 00:00:00.000000-0700','2012-10-13 00:00:00.000000-0700',NULL);
INSERT INTO "missions" VALUES(22,'Lights off for a week!','Keep the lights off in empty rooms for a week.','If you have a habit of leaving lights on, make an extra effort to keep lights in 2-3  rooms off when not in use.  You''ll save a surprising amount of electricity - and money.','Make an extra effort to keep lights off in empty rooms for a week!','Great! Keep it up and repeat this mission!',75,1,4.8,'Kilowatt Hours','2012-09-23 00:22:17.000000+0000','2012-09-23 00:22:17.000000+0000',NULL,'2012-10-13 00:00:00.000000-0700','2012-10-13 00:00:00.000000-0700',0);
INSERT INTO "missions" VALUES(23,'Stop','Stop breathing for one day.','Hint: it''s not worth it.','Hold your breath for 24 hours.','Oh NO you didn''t.',22,0,2.2,'lbs CO2','2012-09-23 00:31:30.000000+0000','2012-09-23 00:31:30.000000+0000',NULL,'2012-10-13 23:59:00.000000-0700','2012-10-13 23:59:00.000000-0700',NULL);
INSERT INTO "missions" VALUES(25,'Winter Window Wrap','Do you feel cold sitting by the window in winter? Add insulating plastic to warm the room and cut down on heating costs!','In any home, windows are a major source of heat loss in the winter.  Plastic wrap over even small window can save you $6 each winter!  Plastic window wrap is available at most hardware stores, and online calculators can help you figure your energy and cos','Install insulating plastic wrap over your windows this winter!','Great! Repeat this mission for each window!',640,1,63.0,'CO2 lbs','2012-09-23 00:50:40.000000+0000','2012-09-23 00:50:40.000000+0000',NULL,'2012-10-13 00:00:00.000000-0700','2012-10-13 00:30:00.000000-0700',NULL);
INSERT INTO "missions" VALUES(30,'Fill up with E85','Fill your flex-fuel vehicle with E85!','Many newer cars in the US are "flex-fuel" vehicles and can use 85% ethanol, or E85, instead of regular gasoline. Be sure to check with your dealer or owners manual before filling your tank!  Using E85 in an older or non-flex-fuel vehicle can cause engine ','Fill your flex-fuel vehicle''s gas tank with E85!','You''re a real champ!',235,1,23.0,'lbs CO2','2012-09-23 01:30:23.000000+0000','2012-09-23 01:30:23.000000+0000',NULL,'2012-10-13 00:00:00.000000-0700','2012-10-13 00:15:00.000000-0700',NULL);
INSERT INTO "missions" VALUES(31,'Fill up with biodiesel (BD20)!','Fill the tank of your biodiesel vehicle with BD20!','All regular diesel vehicles can use 20% biodiesel (BD20), which can actually help engines run more smoothly and reduce emissions!  You can find stations that carry BD20 and other biodiesel blends at http://findbiodiesel.org/','Fill your diesel vehicle''s tank with a biodiesel blend.','Great! Keep it up and repeat this mission!',285,1,28.5,'lbs CO2','2012-09-23 02:08:14.000000+0000','2012-09-23 02:08:14.000000+0000',NULL,'2012-10-13 04:00:00.000000-0700','2012-10-13 00:15:00.000000-0700',NULL);
DROP TABLE IF EXISTS 'plots';
CREATE TABLE `plots` (`id` integer PRIMARY KEY AUTOINCREMENT, `garden_id` integer, `layer_id` integer, `created_at` timestamp, `updated_at` timestamp);
DROP TABLE IF EXISTS 'unlockable_plants';
CREATE TABLE `unlockable_plants` (`id` integer PRIMARY KEY AUTOINCREMENT, `world_mission_id` integer, `plant_template_id` integer NOT NULL, `created_at` timestamp, `updated_at` timestamp);
INSERT INTO "unlockable_plants" VALUES(1,1,2,'2012-02-01 07:08:57.000000+0000','2012-02-01 07:08:57.000000+0000');
INSERT INTO "unlockable_plants" VALUES(2,2,3,'2012-02-01 07:08:57.000000+0000','2012-02-01 07:08:57.000000+0000');
INSERT INTO "unlockable_plants" VALUES(3,3,1,'2012-02-01 07:08:58.000000+0000','2012-02-01 07:08:58.000000+0000');
INSERT INTO "unlockable_plants" VALUES(4,4,1,'2012-02-01 07:08:58.000000+0000','2012-02-01 07:08:58.000000+0000');
INSERT INTO "unlockable_plants" VALUES(5,5,1,'2012-02-01 07:08:58.000000+0000','2012-02-01 07:08:58.000000+0000');
INSERT INTO "unlockable_plants" VALUES(6,6,1,'2012-02-01 07:08:58.000000+0000','2012-02-01 07:08:58.000000+0000');
DROP TABLE IF EXISTS 'grounds';
CREATE TABLE `grounds` (`id` integer PRIMARY KEY AUTOINCREMENT, `garden_id` integer, `x` integer, `y` integer, `wetness` integer, `nutrients` integer, `created_at` timestamp, `updated_at` timestamp);
INSERT INTO "grounds" VALUES(1,3,2,4,10,7,'2012-02-13 03:36:21.000000+0000','2012-02-13 03:36:21.000000+0000');
INSERT INTO "grounds" VALUES(2,3,4,6,10,7,'2012-04-21 18:37:43.000000+0000','2012-04-21 18:37:43.000000+0000');
INSERT INTO "grounds" VALUES(3,3,7,5,10,7,'2012-04-21 18:44:00.000000+0000','2012-04-21 18:44:00.000000+0000');
INSERT INTO "grounds" VALUES(4,3,6,5,10,7,'2012-04-21 18:44:11.000000+0000','2012-04-21 18:44:11.000000+0000');
INSERT INTO "grounds" VALUES(5,3,1,6,10,7,'2012-04-22 00:16:16.000000+0000','2012-04-22 00:16:16.000000+0000');
INSERT INTO "grounds" VALUES(6,3,4,4,10,7,'2012-05-19 23:27:04.000000+0000','2012-05-19 23:27:04.000000+0000');
INSERT INTO "grounds" VALUES(7,3,0,5,10,7,'2012-05-19 23:27:16.000000+0000','2012-05-19 23:27:16.000000+0000');
INSERT INTO "grounds" VALUES(8,3,5,6,10,7,'2012-09-23 03:10:57.000000+0000','2012-09-23 03:10:57.000000+0000');
INSERT INTO "grounds" VALUES(9,3,1,4,10,7,'2012-09-23 03:11:05.000000+0000','2012-09-23 03:11:05.000000+0000');
INSERT INTO "grounds" VALUES(10,3,4,5,10,7,'2012-09-23 03:11:19.000000+0000','2012-09-23 03:11:19.000000+0000');
INSERT INTO "grounds" VALUES(11,3,7,6,10,7,'2012-09-24 05:31:20.000000+0000','2012-09-24 05:31:20.000000+0000');
DROP TABLE IF EXISTS 'users';
CREATE TABLE `users` (`id` integer PRIMARY KEY AUTOINCREMENT, `email` varchar(255), `total_points` integer DEFAULT 0, `created_at` timestamp, `updated_at` timestamp, `available_points` integer DEFAULT 0, `role` integer DEFAULT 0, `first_name` varchar(255), `avatarImg` varchar(255), `encrypted_password` varchar(128) NOT NULL, `password_salt` varchar(255) NOT NULL, `reset_password_token` varchar(255), `remember_token` varchar(255), `remember_created_at` timestamp, `sign_in_count` integer DEFAULT 0, `current_sign_in_at` timestamp, `last_sign_in_at` timestamp, `current_sign_in_ip` varchar(255), `last_sign_in_ip` varchar(255));
INSERT INTO "users" VALUES(1,'yowhan@gmail.com',500,'2012-02-01 07:08:57.000000+0000','2012-02-08 05:47:23.000000+0000',500,1,NULL,NULL,'','',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL);
INSERT INTO "users" VALUES(2,'cooleycr@gmail.com',13049,'2012-02-01 07:08:57.000000+0000','2012-10-13 20:16:53.000000+0000',12459,1,NULL,NULL,'8dab3af1c893a7f5f156aa71ba796e157995b291','zSmbBjyOAqdRN_OOZPiV',NULL,NULL,NULL,12,'2012-10-13 19:31:44.000000+0000','2012-09-24 05:26:34.000000+0000','71.212.22.189','24.18.46.217');
INSERT INTO "users" VALUES(3,'akgrandhi@gmail.com',500,'2012-02-01 07:08:57.000000+0000','2012-02-08 05:47:23.000000+0000',500,1,NULL,NULL,'','',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL);
INSERT INTO "users" VALUES(4,'jgerrish@gmail.com',590,'2012-02-08 05:41:44.000000+0000','2012-09-22 21:09:54.000000+0000',590,0,'Josh',NULL,'35f872715bf9cc9d6e9a1dc44d6447fc8ce09660','DDS-LxYSKUkqY1XkIVpF','rSuFxgzXvawpfYDtFGLR',NULL,NULL,7,'2012-09-22 20:59:02.000000+0000','2012-06-30 23:52:11.000000+0000','71.212.7.224','71.212.2.188');
INSERT INTO "users" VALUES(5,'lewis.bridget@gmail.com',504,'2012-02-09 03:59:45.000000+0000','2012-03-19 02:23:48.000000+0000',504,0,NULL,NULL,'','','lCVL_d2u9110AqPtRP2p',NULL,NULL,0,NULL,NULL,NULL,NULL);
INSERT INTO "users" VALUES(6,'lvasumathi@gmail.com',500,'2012-03-19 02:50:27.000000+0000','2012-03-19 02:54:39.000000+0000',500,0,NULL,NULL,'4940e45a2da483675299c3e0c1e704f2181bc4b9','JNlyWUB_G7UvTEV9u_hS',NULL,NULL,NULL,1,'2012-03-19 02:50:28.000000+0000','2012-03-19 02:50:28.000000+0000','24.16.9.109','24.16.9.109');
INSERT INTO "users" VALUES(7,'isaac.emery@gmail.com',2559,'2012-03-19 02:52:52.000000+0000','2012-09-23 02:31:11.000000+0000',2559,1,'Grimnebulin',NULL,'631a3579bad09a9136f8c58acc749f9ebb6cc4a7','kbTsS8V8eni26U9yTJvD','GWeqBTGJHBzakaQTkc0k',NULL,NULL,2,'2012-09-22 20:32:38.000000+0000','2012-03-19 02:52:52.000000+0000','71.212.7.224','24.16.9.109');
DROP TABLE IF EXISTS 'world_missions';
CREATE TABLE `world_missions` (`id` integer PRIMARY KEY AUTOINCREMENT, `world_id` integer NOT NULL, `name` varchar(255) NOT NULL, `description` text NOT NULL, `mission_id` integer, `tag` varchar(255), `required` boolean DEFAULT 'f', `created_at` timestamp, `updated_at` timestamp, `link_css_top` integer, `link_css_left` integer, `link_css_width` integer, `link_css_padding` integer, `link_css_zindex` integer);
INSERT INTO "world_missions" VALUES(1,1,'Lavender Patch','<p>Your epic journey begins here...</p>',1,NULL,'t','2012-02-01 07:08:57.000000+0000','2012-02-01 07:08:57.000000+0000',338,63,206,191,51);
INSERT INTO "world_missions" VALUES(2,1,'Cobblestone Path','<p>Take a stroll through the garden.</p>',NULL,'home','t','2012-02-01 07:08:57.000000+0000','2012-02-01 07:08:57.000000+0000',467,195,232,205,50);
INSERT INTO "world_missions" VALUES(3,1,'Lake Reflection','<p>Let''s stop for a bit of meditation and reflection.</p>',NULL,'water','t','2012-02-01 07:08:57.000000+0000','2012-02-01 07:08:57.000000+0000',307,299,280,132,NULL);
INSERT INTO "world_missions" VALUES(4,1,'Puffy Clouds','<p>Saving the world is not a pie in the sky.</p>',NULL,'CO2','f','2012-02-01 07:08:58.000000+0000','2012-02-01 07:08:58.000000+0000',17,206,292,131,NULL);
INSERT INTO "world_missions" VALUES(5,1,'Picnic','<p>How about a cold refreshing drink and tasty snack?</p>',NULL,'corn','f','2012-02-01 07:08:58.000000+0000','2012-02-01 07:08:58.000000+0000',459,536,274,149,NULL);
INSERT INTO "world_missions" VALUES(6,1,'Sunshine','<p>Enjoy the sun while it lasts!</p>',NULL,'electricity','f','2012-02-01 07:08:58.000000+0000','2012-02-01 07:08:58.000000+0000',22,708,163,156,NULL);
DROP TABLE IF EXISTS `schema_migrations`;
CREATE TABLE `schema_migrations` (`version` varchar(255) NOT NULL, PRIMARY KEY (`version`));
INSERT INTO "schema_migrations" VALUES('20090522063447');
INSERT INTO "schema_migrations" VALUES('20090522064722');
INSERT INTO "schema_migrations" VALUES('20090617031512');
INSERT INTO "schema_migrations" VALUES('20090617034005');
INSERT INTO "schema_migrations" VALUES('20090617044610');
INSERT INTO "schema_migrations" VALUES('20090818033746');
INSERT INTO "schema_migrations" VALUES('20090818041018');
INSERT INTO "schema_migrations" VALUES('20090818042050');
INSERT INTO "schema_migrations" VALUES('20090818051606');
INSERT INTO "schema_migrations" VALUES('20090818055045');
INSERT INTO "schema_migrations" VALUES('20090818062015');
INSERT INTO "schema_migrations" VALUES('20090818062121');
INSERT INTO "schema_migrations" VALUES('20090922051543');
INSERT INTO "schema_migrations" VALUES('20090922055355');
INSERT INTO "schema_migrations" VALUES('20090929042053');
INSERT INTO "schema_migrations" VALUES('20090929042445');
INSERT INTO "schema_migrations" VALUES('20090929043042');
INSERT INTO "schema_migrations" VALUES('20091110072014');
INSERT INTO "schema_migrations" VALUES('20091117044427');
INSERT INTO "schema_migrations" VALUES('20091117061752');
INSERT INTO "schema_migrations" VALUES('20091117070415');
INSERT INTO "schema_migrations" VALUES('20091215043114');
INSERT INTO "schema_migrations" VALUES('20091215043528');
INSERT INTO "schema_migrations" VALUES('20100112055536');
INSERT INTO "schema_migrations" VALUES('20100112062225');
INSERT INTO "schema_migrations" VALUES('20100112213800');
INSERT INTO "schema_migrations" VALUES('20100406045243');
INSERT INTO "schema_migrations" VALUES('20100525040702');
INSERT INTO "schema_migrations" VALUES('20100626185340');
INSERT INTO "schema_migrations" VALUES('20100626231518');
INSERT INTO "schema_migrations" VALUES('20100626231823');
INSERT INTO "schema_migrations" VALUES('20100627011800');
INSERT INTO "schema_migrations" VALUES('20100707054333');
INSERT INTO "schema_migrations" VALUES('20100707070441');
INSERT INTO "schema_migrations" VALUES('20100930053208');
INSERT INTO "schema_migrations" VALUES('20101019041059');
INSERT INTO "schema_migrations" VALUES('20101019041431');
INSERT INTO "schema_migrations" VALUES('20101019070236');
INSERT INTO "schema_migrations" VALUES('20101019070436');
INSERT INTO "schema_migrations" VALUES('20120318234751');
INSERT INTO "schema_migrations" VALUES('20120319024308');
INSERT INTO "schema_migrations" VALUES('20120519210727');
INSERT INTO "schema_migrations" VALUES('20120922211806');
DROP TABLE IF EXISTS `signup_emails`;
CREATE TABLE `signup_emails` (`id` integer PRIMARY KEY AUTOINCREMENT, `email` varchar(255), `created_at` timestamp, `updated_at` timestamp);
INSERT INTO "signup_emails" VALUES(1,'cooleycr@gmail.com','2012-02-01 07:40:12.000000+0000','2012-02-01 07:40:12.000000+0000');
INSERT INTO "signup_emails" VALUES(2,'jgerrish@gmail.com','2012-02-08 05:29:28.000000+0000','2012-02-08 05:29:28.000000+0000');
DROP TABLE IF EXISTS `mission_statuses`;
CREATE TABLE `mission_statuses` (`id` integer PRIMARY KEY AUTOINCREMENT, `mission_id` integer, `user_id` integer, `status` integer, `int_data` integer, `startDate` date, `created_at` timestamp, `updated_at` timestamp, `repeats` integer DEFAULT 0);
INSERT INTO "mission_statuses" VALUES(2,2,5,2,NULL,NULL,'2012-02-09 04:01:33.000000+0000','2012-02-09 04:06:08.000000+0000',0);
INSERT INTO "mission_statuses" VALUES(3,1,4,2,NULL,NULL,'2012-02-12 21:35:10.000000+0000','2012-02-12 21:35:12.000000+0000',0);
INSERT INTO "mission_statuses" VALUES(4,1,5,2,NULL,NULL,'2012-03-18 21:07:20.000000+0000','2012-03-18 21:07:23.000000+0000',0);
INSERT INTO "mission_statuses" VALUES(5,1,6,2,NULL,NULL,'2012-03-19 02:54:36.000000+0000','2012-03-19 02:54:39.000000+0000',0);
INSERT INTO "mission_statuses" VALUES(6,2,2,2,NULL,NULL,'2012-07-01 02:17:03.000000+0000','2012-07-01 02:23:49.000000+0000',0);
INSERT INTO "mission_statuses" VALUES(7,1,2,2,NULL,NULL,'2012-07-01 02:23:19.000000+0000','2012-10-13 20:16:16.000000+0000',0);
INSERT INTO "mission_statuses" VALUES(8,2,7,2,NULL,NULL,'2012-09-22 20:39:15.000000+0000','2012-09-23 02:29:43.000000+0000',0);
INSERT INTO "mission_statuses" VALUES(10,4,4,1,NULL,NULL,'2012-09-22 21:08:51.000000+0000','2012-09-22 21:08:51.000000+0000',0);
INSERT INTO "mission_statuses" VALUES(11,4,2,2,NULL,NULL,'2012-09-22 21:10:37.000000+0000','2012-09-23 02:02:08.000000+0000',1);
INSERT INTO "mission_statuses" VALUES(12,11,2,1,NULL,NULL,'2012-09-22 23:46:21.000000+0000','2012-09-23 02:58:06.000000+0000',1);
INSERT INTO "mission_statuses" VALUES(13,5,2,2,NULL,NULL,'2012-09-22 23:47:28.000000+0000','2012-09-23 00:02:41.000000+0000',0);
INSERT INTO "mission_statuses" VALUES(14,6,2,1,NULL,NULL,'2012-09-23 00:03:00.000000+0000','2012-09-23 02:58:56.000000+0000',2);
INSERT INTO "mission_statuses" VALUES(15,7,2,2,NULL,NULL,'2012-09-23 00:05:42.000000+0000','2012-09-23 02:01:59.000000+0000',1);
INSERT INTO "mission_statuses" VALUES(16,5,7,2,NULL,NULL,'2012-09-23 02:30:08.000000+0000','2012-09-23 02:30:57.000000+0000',0);
INSERT INTO "mission_statuses" VALUES(17,12,7,2,NULL,NULL,'2012-09-23 02:30:27.000000+0000','2012-09-23 02:31:06.000000+0000',1);
INSERT INTO "mission_statuses" VALUES(18,21,7,2,NULL,NULL,'2012-09-23 02:30:40.000000+0000','2012-09-23 02:31:11.000000+0000',1);
INSERT INTO "mission_statuses" VALUES(19,20,2,1,NULL,NULL,'2012-09-24 05:28:53.000000+0000','2012-09-24 05:28:53.000000+0000',0);
INSERT INTO "mission_statuses" VALUES(20,13,2,2,NULL,NULL,'2012-09-24 05:29:06.000000+0000','2012-09-24 05:29:49.000000+0000',1);
INSERT INTO "mission_statuses" VALUES(21,9,2,2,NULL,NULL,'2012-10-13 20:16:40.000000+0000','2012-10-13 20:16:53.000000+0000',1);
DROP TABLE IF EXISTS `worlds`;
CREATE TABLE `worlds` (`id` integer PRIMARY KEY AUTOINCREMENT, `name` varchar(255) NOT NULL, `description` text NOT NULL, `map_image` varchar(255) NOT NULL, `prequisite_world_id` integer, `created_at` timestamp, `updated_at` timestamp);
INSERT INTO "worlds" VALUES(1,'Meadow World','Welcome to Heroes in Green! <p> Meadow world is a place of simple beauty and tranquility. Here we will take baby steps to start our heroic journey to a greener Earth. Along the way, we have many enjoyable treats and surprises for you! Watch as your efforts get turned back into carbon, which we can use to grow your very own garden! </p>','meadow.gif',NULL,'2012-02-01 07:08:57.000000+0000','2012-02-01 07:08:57.000000+0000');
DROP TABLE IF EXISTS `mission_tag_mappings`;
CREATE TABLE `mission_tag_mappings` (`id` integer PRIMARY KEY AUTOINCREMENT, `mission_id` integer, `mission_tag_id` integer, `created_at` timestamp, `updated_at` timestamp);
DROP TABLE IF EXISTS `plants`;
CREATE TABLE `plants` (`id` integer PRIMARY KEY AUTOINCREMENT, `plant_template_id` integer, `health` integer, `created_at` timestamp, `updated_at` timestamp, `height` integer, `radius` integer, `ground_id` integer, `layer_id` integer, `growth_ticks` integer);
INSERT INTO "plants" VALUES(4,3,10,'2012-04-21 18:44:11.000000+0000','2012-10-13 20:17:14.000000+0000',12,12,4,NULL,172);
INSERT INTO "plants" VALUES(7,3,10,'2012-05-19 23:27:16.000000+0000','2012-10-13 20:17:14.000000+0000',11,11,7,NULL,145);
INSERT INTO "plants" VALUES(8,3,10,'2012-09-23 03:10:57.000000+0000','2012-10-13 20:17:15.000000+0000',7,7,8,NULL,20);
INSERT INTO "plants" VALUES(10,2,2,'2012-09-23 03:11:19.000000+0000','2012-10-13 20:17:16.000000+0000',5,5,10,NULL,1);
INSERT INTO "plants" VALUES(11,3,10,'2012-09-24 05:31:20.000000+0000','2012-10-13 20:17:16.000000+0000',7,7,11,NULL,19);
DROP TABLE IF EXISTS `sessions`;
CREATE TABLE `sessions` (`id` integer PRIMARY KEY AUTOINCREMENT, `session_id` varchar(255) NOT NULL, `data` text, `created_at` timestamp, `updated_at` timestamp);
INSERT INTO "sessions" VALUES(1,'81e7b255f6460302238b7a215e574417','BAh7BzoQX2NzcmZfdG9rZW4iMTJHYy94cC84Y3dDVythaENHeFRXMG0zeGdP
VkZZdk13QkNBekRXbGxtUFk9IgpmbGFzaElDOidBY3Rpb25Db250cm9sbGVy
OjpGbGFzaDo6Rmxhc2hIYXNoewAGOgpAdXNlZHsA
','2012-02-01 07:21:12.000000+0000','2012-02-01 07:21:12.000000+0000');
INSERT INTO "sessions" VALUES(2,'8714660782be8ea2a1470db950514b44','BAh7BzoQX2NzcmZfdG9rZW4iMVJTcmVvQTAzalYrc2xrbmhhN2N0bksrQUpr
NVlvMVVDanh6R0hrd29halU9IgpmbGFzaElDOidBY3Rpb25Db250cm9sbGVy
OjpGbGFzaDo6Rmxhc2hIYXNoewAGOgpAdXNlZHsA
','2012-02-01 07:38:20.000000+0000','2012-02-03 04:18:54.000000+0000');
INSERT INTO "sessions" VALUES(3,'ca97e560dd8522b9d132be9d99059e0e','BAh7BzoQX2NzcmZfdG9rZW4iMWF2Qy9VMGQzYVBVRVd4UUp6TEpFa3lIbVQw
YlJndXhVM00rUHJDZGdSb2c9IgpmbGFzaElDOidBY3Rpb25Db250cm9sbGVy
OjpGbGFzaDo6Rmxhc2hIYXNoewAGOgpAdXNlZHsA
','2012-02-03 11:42:40.000000+0000','2012-02-03 11:42:40.000000+0000');
INSERT INTO "sessions" VALUES(4,'a2511892104aabf1c7e2628129d1762c','BAh7BzoQX2NzcmZfdG9rZW4iMVYvWUVrRlEvZmJxS09Xb0EwbmIwVEllbk9o
RC9JZ2RmNG9TSno3a3d4VTQ9IgpmbGFzaElDOidBY3Rpb25Db250cm9sbGVy
OjpGbGFzaDo6Rmxhc2hIYXNoewAGOgpAdXNlZHsA
','2012-02-07 06:14:28.000000+0000','2012-02-07 06:14:28.000000+0000');
INSERT INTO "sessions" VALUES(5,'3a48d5b802921ded8bbd2698643d4e7c','BAh7CDoQX2NzcmZfdG9rZW4iMUkyZExWeVFBK3ZscEp6anl5VVp6Y25tb2FQ
YjR2cmYrcktjeHpKV1lsOUE9IgpmbGFzaElDOidBY3Rpb25Db250cm9sbGVy
OjpGbGFzaDo6Rmxhc2hIYXNoewAGOgpAdXNlZHsAOgx1c2VyX2lkaQk=
','2012-02-08 05:29:21.000000+0000','2012-02-08 05:50:09.000000+0000');
INSERT INTO "sessions" VALUES(6,'2e4a21d55727008b3466dd9027c49698','BAh7CDoQX2NzcmZfdG9rZW4iMU9PTE5wVXZvd3JOc3drWWdVNDFxamE5eTM1
MTJuYnMwdENxbXJ0Q1h1TkU9Ogx1c2VyX2lkaQciCmZsYXNoSUM6J0FjdGlv
bkNvbnRyb2xsZXI6OkZsYXNoOjpGbGFzaEhhc2h7AAY6CkB1c2VkewA=
','2012-02-08 06:10:51.000000+0000','2012-02-08 06:11:36.000000+0000');
INSERT INTO "sessions" VALUES(7,'d0fba7aede037a39b72039a7a05a9d2c','BAh7CDoQX2NzcmZfdG9rZW4iMUgxTkNQU04xckEyMEt4RWNIcnE3VDRPbzFL
bm9VaTlQV3FFS0lnNUQzZDA9Ogx1c2VyX2lkaQoiCmZsYXNoSUM6J0FjdGlv
bkNvbnRyb2xsZXI6OkZsYXNoOjpGbGFzaEhhc2h7AAY6CkB1c2VkewA=
','2012-02-09 03:59:31.000000+0000','2012-02-09 04:17:10.000000+0000');
INSERT INTO "sessions" VALUES(8,'4d627e90d91aa0a1d9358e5af5643acb','BAh7BzoQX2NzcmZfdG9rZW4iMUJRZ1J6Q1I5Y0kwazZiTGszclYyM0FtMDV0
VlZwalY0a0JhaHdrSGRQcUU9IgpmbGFzaElDOidBY3Rpb25Db250cm9sbGVy
OjpGbGFzaDo6Rmxhc2hIYXNoewY6CmVycm9ybzoZQWN0aXZlUmVjb3JkOjpF
cnJvcnMHOgxAZXJyb3JzewYiCmVtYWlsWwYiE2Nhbid0IGJlIGJsYW5rOgpA
YmFzZW86EFNpZ251cEVtYWlsCToQQGF0dHJpYnV0ZXN7CCIPY3JlYXRlZF9h
dDAiD3VwZGF0ZWRfYXQwIgplbWFpbDA7CUAJOhBAbmV3X3JlY29yZFQ6FkBh
dHRyaWJ1dGVzX2NhY2hlewAGOgpAdXNlZHsGOwdG
','2012-02-09 04:13:41.000000+0000','2012-02-09 04:14:06.000000+0000');
INSERT INTO "sessions" VALUES(9,'8b8c60e3122017b8ec535da3773f5961','BAh7CDoQX2NzcmZfdG9rZW4iMWRkbUp5OGp4b3IwL01zbUlZcG1hRno0L1Vz
TkZUdjJNU3lxaW01S0VJVWs9Ogx1c2VyX2lkaQkiCmZsYXNoSUM6J0FjdGlv
bkNvbnRyb2xsZXI6OkZsYXNoOjpGbGFzaEhhc2h7AAY6CkB1c2VkewA=
','2012-02-09 04:14:00.000000+0000','2012-02-09 04:46:12.000000+0000');
INSERT INTO "sessions" VALUES(10,'e1b1026e02ec6714a4e623ab818e57a6','BAh7CDoQX2NzcmZfdG9rZW4iMUduS2hPMWt0RUtwZ3hUa3pzRldXN2hISFBw
WmVOU0NCcVYzYkxnNTNUdms9Ogx1c2VyX2lkaQciCmZsYXNoSUM6J0FjdGlv
bkNvbnRyb2xsZXI6OkZsYXNoOjpGbGFzaEhhc2h7AAY6CkB1c2VkewA=
','2012-02-12 19:04:44.000000+0000','2012-02-13 03:37:46.000000+0000');
INSERT INTO "sessions" VALUES(11,'335a47c4003c20f4e6e1d110d433607b','BAh7BzoQX2NzcmZfdG9rZW4iMTMzcW45MVlJZUduSDg5dzRuckNaUnZXYzVM
K2JsbVFyOW5JVjNGQTRsK2s9IgpmbGFzaElDOidBY3Rpb25Db250cm9sbGVy
OjpGbGFzaDo6Rmxhc2hIYXNoewAGOgpAdXNlZHsA
','2012-02-16 02:58:46.000000+0000','2012-02-16 02:58:46.000000+0000');
INSERT INTO "sessions" VALUES(12,'db6569f3aca38412cfe7f9cb351d0201','BAh7BzoQX2NzcmZfdG9rZW4iMVlENEFOT3lKYXdQUUgwWkh0M0UxVVhoeGdt
NXJiTnFzNG9tN096ZDVaVjQ9IgpmbGFzaElDOidBY3Rpb25Db250cm9sbGVy
OjpGbGFzaDo6Rmxhc2hIYXNoewAGOgpAdXNlZHsA
','2012-03-08 02:38:57.000000+0000','2012-03-08 02:38:57.000000+0000');
INSERT INTO "sessions" VALUES(13,'a8ac04b5717a3cf2bee946c626c90c3c','BAh7BzoQX2NzcmZfdG9rZW4iMXhBTFhMK3JXL1BMTDBtNHJhV3NCMi85UkhQ
ZnQ1VVRYK1RjS1N4TTYzY0E9IgpmbGFzaElDOidBY3Rpb25Db250cm9sbGVy
OjpGbGFzaDo6Rmxhc2hIYXNoewAGOgpAdXNlZHsA
','2012-03-08 04:24:51.000000+0000','2012-03-08 04:24:51.000000+0000');
INSERT INTO "sessions" VALUES(14,'386f206e3b373511c03108bac28bae0a','BAh7CCIZd2FyZGVuLnVzZXIudXNlci5rZXlbB2MJVXNlcmkHOhBfY3NyZl90
b2tlbiIxK0FFZHFHUmdJd28rN3ZNbjlZcmhsTjRscHU5aVBKem1uY3YvdkE1
cU9jMD0iCmZsYXNoSUM6J0FjdGlvbkNvbnRyb2xsZXI6OkZsYXNoOjpGbGFz
aEhhc2h7BjoLbm90aWNlIjBCbGFja2JlcnJ5IGhhcyBzdWNjZXNzZnVsbHkg
YmVlbiBwdXJjaGFzZWQhBjoKQHVzZWR7BjsHVA==
','2012-03-18 18:28:35.000000+0000','2012-04-22 00:16:17.000000+0000');
INSERT INTO "sessions" VALUES(15,'5d5875c27e5fc2bd71666b4bf4e29d38','BAh7CDoQX2NzcmZfdG9rZW4iMVZtdmpOSCt3M3BTSGFsSHYwNVRKbXdjVjFU
OUp3ZHlSNXdTY3A5M1hNb0U9Ogx1c2VyX2lkaQkiCmZsYXNoSUM6J0FjdGlv
bkNvbnRyb2xsZXI6OkZsYXNoOjpGbGFzaEhhc2h7AAY6CkB1c2VkewA=
','2012-03-18 19:24:46.000000+0000','2012-03-18 20:34:37.000000+0000');
INSERT INTO "sessions" VALUES(16,'3af574dea011e29415311c0bdd7b9205','BAh7CToMdXNlcl9pZGkKIhl3YXJkZW4udXNlci51c2VyLmtleVsHYwlVc2Vy
aQc6EF9jc3JmX3Rva2VuIjFUcVVIK1k2Mnd6WHI4VzdCRGIvek1HWVZpcldK
RXRZTmxZQUIvcGJYSGowPSIKZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6
Rmxhc2g6OkZsYXNoSGFzaHsGOgtub3RpY2UiHFNpZ25lZCBpbiBzdWNjZXNz
ZnVsbHkuBjoKQHVzZWR7BjsIVA==
','2012-03-18 20:28:18.000000+0000','2012-03-19 02:53:39.000000+0000');
INSERT INTO "sessions" VALUES(17,'46387533f7f788f786f1beca620c66c6','BAh7CSIZd2FyZGVuLnVzZXIudXNlci5rZXlbB2MJVXNlcmkJOgx1c2VyX2lk
aQk6EF9jc3JmX3Rva2VuIjFab2ZuL0pWS0sxc1FrNGtTQW1lNFVlWUwrd2Ix
N1pYTGN3QU9mSGhRRFA4PSIKZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6
Rmxhc2g6OkZsYXNoSGFzaHsGOgtub3RpY2UiQ1lvdXIgcGFzc3dvcmQgd2Fz
IGNoYW5nZWQgc3VjY2Vzc2Z1bGx5LiBZb3UgYXJlIG5vdyBzaWduZWQgaW4u
BjoKQHVzZWR7BjsIVA==
','2012-03-18 20:38:17.000000+0000','2012-03-19 05:50:35.000000+0000');
INSERT INTO "sessions" VALUES(18,'39c18a4f6d89536bf0d1be8d48c304d2','BAh7CCIZd2FyZGVuLnVzZXIudXNlci5rZXlbB2MJVXNlcmkLOhBfY3NyZl90
b2tlbiIxdWVxV1ZsQk1XbjU3Z21qUURIUjBydDhvLzJtS3RHbnVTL3RiektD
RlZRaz0iCmZsYXNoSUM6J0FjdGlvbkNvbnRyb2xsZXI6OkZsYXNoOjpGbGFz
aEhhc2h7BjoLbm90aWNlIj9DbGljayBvbiBhIGhpZ2hsaWdodGVkIGdhcmRl
biBhcmVhIHRvIHBsYWNlIHRoZSBGZXJuIHRoZXJlBjoKQHVzZWR7BjsHVA==
','2012-03-19 02:20:54.000000+0000','2012-03-19 02:55:42.000000+0000');
INSERT INTO "sessions" VALUES(19,'f663c2730aa5e6d181bf12af5184eba1','BAh7BzoQX2NzcmZfdG9rZW4iMWR5bEZPUk52ZEt4NW5UdjBpdVhVWFY1RFJ3
bElwdmUwd09pZ1RvV1VTZ0U9IgpmbGFzaElDOidBY3Rpb25Db250cm9sbGVy
OjpGbGFzaDo6Rmxhc2hIYXNoewY6CmFsZXJ0IjZZb3UgbmVlZCB0byBzaWdu
IGluIG9yIHNpZ24gdXAgYmVmb3JlIGNvbnRpbnVpbmcuBjoKQHVzZWR7BjsH
VA==
','2012-03-29 05:54:48.000000+0000','2012-03-29 05:54:48.000000+0000');
INSERT INTO "sessions" VALUES(20,'d9a06bf77747eb808a844319f9ee5bed','BAh7BzoQX2NzcmZfdG9rZW4iMTliUzRIN0o5WmZjV0RaQ2d4VVpaSlAwaERB
OEphdno5MnkxWmY1c2p5UVU9IgpmbGFzaElDOidBY3Rpb25Db250cm9sbGVy
OjpGbGFzaDo6Rmxhc2hIYXNoewY6CmFsZXJ0IjZZb3UgbmVlZCB0byBzaWdu
IGluIG9yIHNpZ24gdXAgYmVmb3JlIGNvbnRpbnVpbmcuBjoKQHVzZWR7BjsH
VA==
','2012-03-29 06:16:58.000000+0000','2012-03-29 06:16:58.000000+0000');
INSERT INTO "sessions" VALUES(21,'b64dcaddbf60f5e243a7c2017134cc99','BAh7CCIZd2FyZGVuLnVzZXIudXNlci5rZXlbB2MJVXNlcmkJOhBfY3NyZl90
b2tlbiIxcHFCLzd1bm8zV0EzcWxpRGdrWE5EQllzS1d0VnM1KzVMZi9JUjJT
MUVSST0iCmZsYXNoSUM6J0FjdGlvbkNvbnRyb2xsZXI6OkZsYXNoOjpGbGFz
aEhhc2h7AAY6CkB1c2VkewA=
','2012-04-21 18:35:01.000000+0000','2012-04-21 18:35:27.000000+0000');
INSERT INTO "sessions" VALUES(22,'6091c688c68b40a920aec07e0c246845','BAh7CDoQX2NzcmZfdG9rZW4iMUxWWVJsRGRnOExMaW1SWGttQUhYUCtScmM2
dkhsYStDTzltWkJZMmw4NWM9Ihl3YXJkZW4udXNlci51c2VyLmtleVsHYwlV
c2VyaQkiCmZsYXNoSUM6J0FjdGlvbkNvbnRyb2xsZXI6OkZsYXNoOjpGbGFz
aEhhc2h7AAY6CkB1c2VkewA=
','2012-05-19 21:01:07.000000+0000','2012-05-19 22:47:29.000000+0000');
INSERT INTO "sessions" VALUES(23,'9e6f0afa900f11cbef2740c5a33b5b7e','BAh7CCIZd2FyZGVuLnVzZXIudXNlci5rZXlbB2MJVXNlcmkHOhBfY3NyZl90
b2tlbiIxRUkyblo0QVQvUlhZY1QwTHRsWUZpSVBVdG5qcUR6TkVWeVNYWXd2
WGhQRT0iCmZsYXNoSUM6J0FjdGlvbkNvbnRyb2xsZXI6OkZsYXNoOjpGbGFz
aEhhc2h7AAY6CkB1c2VkewA=
','2012-05-19 21:09:52.000000+0000','2012-05-20 01:48:22.000000+0000');
INSERT INTO "sessions" VALUES(24,'e77250f11d5acce36fff2489f516bc24','BAh7CDoTdXNlci5yZXR1cm5fdG8iHy9taXNzaW9uX2dhbWUvZmluZF9taXNz
aW9uOhBfY3NyZl90b2tlbiIxZmNUOVVxTStTSUxpVThCSi9HUGtPOEFOcG14
M1lBcmFuVDNqSnd6Wi9qND0iCmZsYXNoSUM6J0FjdGlvbkNvbnRyb2xsZXI6
OkZsYXNoOjpGbGFzaEhhc2h7BjoKYWxlcnQiNllvdSBuZWVkIHRvIHNpZ24g
aW4gb3Igc2lnbiB1cCBiZWZvcmUgY29udGludWluZy4GOgpAdXNlZHsGOwhU
','2012-05-22 06:16:44.000000+0000','2012-05-22 06:16:47.000000+0000');
INSERT INTO "sessions" VALUES(25,'5a793199a20c31a09f65e5e29676f2cd','BAh7BzoQX2NzcmZfdG9rZW4iMVVpVHR2dmRrRk9hZ3NkRFhmSmF4UlFvbXBt
U2tPbmdaRlhOV0I3OEhWZ2s9IgpmbGFzaElDOidBY3Rpb25Db250cm9sbGVy
OjpGbGFzaDo6Rmxhc2hIYXNoewY6CmFsZXJ0IjZZb3UgbmVlZCB0byBzaWdu
IGluIG9yIHNpZ24gdXAgYmVmb3JlIGNvbnRpbnVpbmcuBjoKQHVzZWR7BjsH
VA==
','2012-05-22 06:44:50.000000+0000','2012-05-22 06:44:50.000000+0000');
INSERT INTO "sessions" VALUES(26,'2a97e0c4e85141b033e4267919b6c068','BAh7BzoQX2NzcmZfdG9rZW4iMURDY1k1NG90R082WEJXY1NxMFZhdGdDdlVn
MUdZNGFlZStZWEw4RVY0dGs9IgpmbGFzaElDOidBY3Rpb25Db250cm9sbGVy
OjpGbGFzaDo6Rmxhc2hIYXNoewY6CmFsZXJ0IjZZb3UgbmVlZCB0byBzaWdu
IGluIG9yIHNpZ24gdXAgYmVmb3JlIGNvbnRpbnVpbmcuBjoKQHVzZWR7BjsH
VA==
','2012-05-23 04:27:04.000000+0000','2012-05-23 04:27:04.000000+0000');
INSERT INTO "sessions" VALUES(27,'2d78191a5942f8c9e918840180348745','BAh7BzoQX2NzcmZfdG9rZW4iMXh5aHh0eFdMQVQraVpDK2MxQWQxMzM2ckcr
UmZydVJWTnpLakQyWWlzczQ9IgpmbGFzaElDOidBY3Rpb25Db250cm9sbGVy
OjpGbGFzaDo6Rmxhc2hIYXNoewY6CmFsZXJ0IjZZb3UgbmVlZCB0byBzaWdu
IGluIG9yIHNpZ24gdXAgYmVmb3JlIGNvbnRpbnVpbmcuBjoKQHVzZWR7BjsH
VA==
','2012-05-25 04:13:07.000000+0000','2012-05-25 04:13:07.000000+0000');
INSERT INTO "sessions" VALUES(28,'bb95f01db508a6a298953109db6b2c40','BAh7CDoQX2NzcmZfdG9rZW4iMXdXNjZWRkw1YmhsaGNZVzlwSVAxL0xBRXBT
THdPdnA1RzVVeS82cHJCajA9Ihl3YXJkZW4udXNlci51c2VyLmtleVsHYwlV
c2VyaQciCmZsYXNoSUM6J0FjdGlvbkNvbnRyb2xsZXI6OkZsYXNoOjpGbGFz
aEhhc2h7AAY6CkB1c2VkewA=
','2012-06-30 18:04:03.000000+0000','2012-07-01 00:16:06.000000+0000');
INSERT INTO "sessions" VALUES(29,'7e23cb7487be610ab356cbb313d88a63','BAh7CDoQX2NzcmZfdG9rZW4iMW10d09FUXJvQzFOTGRaeHJLcDNGNlVndW4r
QVpDNjBHQ1FLTm5Ra0UycU09Ihl3YXJkZW4udXNlci51c2VyLmtleVsHYwlV
c2VyaQkiCmZsYXNoSUM6J0FjdGlvbkNvbnRyb2xsZXI6OkZsYXNoOjpGbGFz
aEhhc2h7AAY6CkB1c2VkewA=
','2012-06-30 19:11:19.000000+0000','2012-06-30 19:11:25.000000+0000');
INSERT INTO "sessions" VALUES(30,'f358b01f864b9131147bf6c42307ce8e','BAh7CDoQX2NzcmZfdG9rZW4iMWdvU01xQ01xRFlzdzVNRWc4U1hHNlF2NmZ2
MFp6cXZLSnZnRldnc2xWc009Ihl3YXJkZW4udXNlci51c2VyLmtleVsHYwlV
c2VyaQkiCmZsYXNoSUM6J0FjdGlvbkNvbnRyb2xsZXI6OkZsYXNoOjpGbGFz
aEhhc2h7AAY6CkB1c2VkewA=
','2012-06-30 19:30:07.000000+0000','2012-06-30 19:30:13.000000+0000');
INSERT INTO "sessions" VALUES(31,'82c230d6c5af2435c4cbfd6520e77f17','BAh7CDoQX2NzcmZfdG9rZW4iMU1WYjNDZVBHSE03MEpHUWZMcXBhd1FKNnox
bW5IZzU3WkpJSEtpZGhBY009Ihl3YXJkZW4udXNlci51c2VyLmtleVsHYwlV
c2VyaQkiCmZsYXNoSUM6J0FjdGlvbkNvbnRyb2xsZXI6OkZsYXNoOjpGbGFz
aEhhc2h7AAY6CkB1c2VkewA=
','2012-06-30 19:40:51.000000+0000','2012-06-30 23:52:20.000000+0000');
INSERT INTO "sessions" VALUES(32,'5fc19161bfba3d803f8c1ad1f2460ce0','BAh7CDoQX2NzcmZfdG9rZW4iMWxoenlnTUNLOEVuMDdBeEQzeUU1VEswd3F2
VlJ0VjRhVkF2Q3VSQ0toeUU9Ihl3YXJkZW4udXNlci51c2VyLmtleVsHYwlV
c2VyaQciCmZsYXNoSUM6J0FjdGlvbkNvbnRyb2xsZXI6OkZsYXNoOjpGbGFz
aEhhc2h7AAY6CkB1c2VkewA=
','2012-09-22 17:49:36.000000+0000','2012-09-22 20:33:06.000000+0000');
INSERT INTO "sessions" VALUES(33,'bd77f754aa509b2f087482a719a1b82d','BAh7CDoQX2NzcmZfdG9rZW4iMVBob2U3ZHRwTC9oaHBrNWt0emFaVjRmUm00
Qm91bVZWVW9CbFdBaHZQNnc9Ihl3YXJkZW4udXNlci51c2VyLmtleVsHYwlV
c2VyaQwiCmZsYXNoSUM6J0FjdGlvbkNvbnRyb2xsZXI6OkZsYXNoOjpGbGFz
aEhhc2h7AAY6CkB1c2VkewA=
','2012-09-22 19:00:26.000000+0000','2012-09-23 02:32:22.000000+0000');
INSERT INTO "sessions" VALUES(34,'c18db1657b8839cfaa2a033b245ebf0d','BAh7BzoQX2NzcmZfdG9rZW4iMUpYSFB5aEZsSFp5RGtQSE5KQllVZmZoMWdT
M21Oc29xVkVlM282MjduRkU9IgpmbGFzaElDOidBY3Rpb25Db250cm9sbGVy
OjpGbGFzaDo6Rmxhc2hIYXNoewY6C25vdGljZSJjWW91IHdpbGwgcmVjZWl2
ZSBhbiBlbWFpbCB3aXRoIGluc3RydWN0aW9ucyBhYm91dCBob3cgdG8gcmVz
ZXQgeW91ciBwYXNzd29yZCBpbiBhIGZldyBtaW51dGVzLgY6CkB1c2VkewY7
B1Q=
','2012-09-22 19:04:10.000000+0000','2012-09-22 20:35:16.000000+0000');
INSERT INTO "sessions" VALUES(35,'0bf24ab3fec668985dd7be26093ce4bb','BAh7BzoQX2NzcmZfdG9rZW4iMSt3WDhKOXN1Mnl5L1dNSTQ1cEJQYVdIUzlp
T2g3WlVNR0liYkJFb2hsSlk9IgpmbGFzaElDOidBY3Rpb25Db250cm9sbGVy
OjpGbGFzaDo6Rmxhc2hIYXNoewAGOgpAdXNlZHsA
','2012-09-22 20:50:41.000000+0000','2012-09-22 20:50:41.000000+0000');
INSERT INTO "sessions" VALUES(36,'d57c79975d2fc73c22b3b8b8be96059b','BAh7CDoQX2NzcmZfdG9rZW4iMTFWWmdlWVJ1aWlPK1IwVzI0bDlubW5aMUM1
ZGo2M2gremlBRW5ENCsyY1k9Ihl3YXJkZW4udXNlci51c2VyLmtleVsHYwlV
c2VyaQkiCmZsYXNoSUM6J0FjdGlvbkNvbnRyb2xsZXI6OkZsYXNoOjpGbGFz
aEhhc2h7AAY6CkB1c2VkewA=
','2012-09-22 20:50:41.000000+0000','2012-09-23 01:14:30.000000+0000');
INSERT INTO "sessions" VALUES(37,'e965ab0ac8b778bb65a12f0a01814483','BAh7CDoQX2NzcmZfdG9rZW4iMVZHQzNpdkZ5a3l0SlV4SWc2K1RrL0crQVUx
bVVKR0x3OGhBWWFjRUROTE09Ihl3YXJkZW4udXNlci51c2VyLmtleVsHYwlV
c2VyaQciCmZsYXNoSUM6J0FjdGlvbkNvbnRyb2xsZXI6OkZsYXNoOjpGbGFz
aEhhc2h7AAY6CkB1c2VkewA=
','2012-09-22 20:51:30.000000+0000','2012-09-23 03:11:29.000000+0000');
INSERT INTO "sessions" VALUES(38,'0705826d7e97b89185b94f5504cef5e3','BAh7CDoQX2NzcmZfdG9rZW4iMWNyUUFhRnNjdmtRRUFON1RXNFBiTTJFWnhE
MXBNUyt2Y29aOWtza09pS1k9Ihl3YXJkZW4udXNlci51c2VyLmtleVsHYwlV
c2VyaQciCmZsYXNoSUM6J0FjdGlvbkNvbnRyb2xsZXI6OkZsYXNoOjpGbGFz
aEhhc2h7AAY6CkB1c2VkewA=
','2012-09-24 05:26:10.000000+0000','2012-09-24 05:31:32.000000+0000');
INSERT INTO "sessions" VALUES(39,'6831495619e94aa1d42c1b5557a49154','BAh7BzoQX2NzcmZfdG9rZW4iMUQ4U29uWUlYOXpPSm5JaUxnb3ArNCtnQTF0
RjdaaEJEUkRuczB6dk9ZMVk9IgpmbGFzaElDOidBY3Rpb25Db250cm9sbGVy
OjpGbGFzaDo6Rmxhc2hIYXNoewAGOgpAdXNlZHsA
','2012-10-03 02:09:45.000000+0000','2012-10-03 02:09:45.000000+0000');
INSERT INTO "sessions" VALUES(40,'20c9640a0f7c1530c38f777d59f05a91','BAh7BzoQX2NzcmZfdG9rZW4iMXduREJyRXA1U3h5R2ZKaDVsV0FYcVNPUEI0
RWZ2enJGSGxkMjREQm9ycms9IgpmbGFzaElDOidBY3Rpb25Db250cm9sbGVy
OjpGbGFzaDo6Rmxhc2hIYXNoewAGOgpAdXNlZHsA
','2012-10-06 04:58:55.000000+0000','2012-10-06 04:58:55.000000+0000');
INSERT INTO "sessions" VALUES(41,'5aa0b7a5a7069cb434bc44729ee19e8f','BAh7BzoQX2NzcmZfdG9rZW4iMXlBSzZHVi9iYy9GK3RKaDh6dSt2cGtDMGRZ
OUpQY29UV2loWG1NUzVqVlE9IgpmbGFzaElDOidBY3Rpb25Db250cm9sbGVy
OjpGbGFzaDo6Rmxhc2hIYXNoewAGOgpAdXNlZHsA
','2012-10-06 20:33:49.000000+0000','2012-10-06 20:33:49.000000+0000');
INSERT INTO "sessions" VALUES(42,'f0edb98af98aa1d23530a4282380f56f','BAh7BzoQX2NzcmZfdG9rZW4iMWRHU1NjN0E4Q2xXQjg4VW1Za1llUzFQRzhx
RE5VSkMvUzByRktaSkRMa0U9IgpmbGFzaElDOidBY3Rpb25Db250cm9sbGVy
OjpGbGFzaDo6Rmxhc2hIYXNoewAGOgpAdXNlZHsA
','2012-10-07 05:07:35.000000+0000','2012-10-07 05:07:35.000000+0000');
INSERT INTO "sessions" VALUES(43,'6cfe21e747953f9c9af6b3832aa91382','BAh7BzoQX2NzcmZfdG9rZW4iMTJ6V1BMamxHNVZCWEVybWVnN1dyVGtTZVcy
YWVXaG5XRzBEejB0czJsN0k9IgpmbGFzaElDOidBY3Rpb25Db250cm9sbGVy
OjpGbGFzaDo6Rmxhc2hIYXNoewAGOgpAdXNlZHsA
','2012-10-08 08:20:41.000000+0000','2012-10-08 08:20:41.000000+0000');
INSERT INTO "sessions" VALUES(44,'d139f8b094472f5fe8c372864e97552f','BAh7CDoQX2NzcmZfdG9rZW4iMXFlY0hnL3VkRU5NRVNtNkhtb1h5eFRzNlk2
T2dkSm1RTGUwVjk1bC9pa3M9Ihl3YXJkZW4udXNlci51c2VyLmtleVsHYwlV
c2VyaQciCmZsYXNoSUM6J0FjdGlvbkNvbnRyb2xsZXI6OkZsYXNoOjpGbGFz
aEhhc2h7BjoLbm90aWNlIkBDbGljayBvbiBhIGhpZ2hsaWdodGVkIGdhcmRl
biBhcmVhIHRvIHBsYWNlIHRoZSBDZWRhciB0aGVyZQY6CkB1c2VkewY7B1Q=
','2012-10-13 19:31:10.000000+0000','2012-10-13 21:21:44.000000+0000');
DROP TABLE IF EXISTS `levels`;
CREATE TABLE `levels` (`id` integer PRIMARY KEY AUTOINCREMENT, `number` integer NOT NULL, `title` varchar(255) NOT NULL, `points_required` integer NOT NULL, `created_at` timestamp, `updated_at` timestamp);
DROP TABLE IF EXISTS `mission_tag_categories`;
CREATE TABLE `mission_tag_categories` (`id` integer PRIMARY KEY AUTOINCREMENT, `mission_tag_category` varchar(255), `created_at` timestamp, `updated_at` timestamp);
DROP TABLE IF EXISTS `gardens`;
CREATE TABLE `gardens` (`id` integer PRIMARY KEY AUTOINCREMENT, `name` varchar(255), `size_x` integer, `size_y` integer, `user_id` integer, `created_at` timestamp, `updated_at` timestamp, `default_wetness` integer, `default_nutrients` integer, `nutrients_replenish` integer, `wetness_replenish` integer);
INSERT INTO "gardens" VALUES(1,NULL,9,7,4,'2012-02-08 05:48:10.000000+0000','2012-09-23 01:02:27.000000+0000',10,7,3,2);
INSERT INTO "gardens" VALUES(2,NULL,9,7,5,'2012-02-09 04:00:48.000000+0000','2012-03-18 21:19:19.000000+0000',10,7,3,2);
INSERT INTO "gardens" VALUES(3,NULL,9,7,2,'2012-02-13 03:35:53.000000+0000','2012-10-13 21:21:44.000000+0000',10,7,3,2);
INSERT INTO "gardens" VALUES(4,NULL,5,5,6,'2012-03-19 02:51:49.000000+0000','2012-03-19 02:55:42.000000+0000',10,7,3,2);
INSERT INTO "gardens" VALUES(5,NULL,5,5,7,'2012-09-23 02:31:21.000000+0000','2012-09-23 02:32:22.000000+0000',10,7,3,2);
DROP TABLE IF EXISTS `plant_templates`;
CREATE TABLE `plant_templates` (`id` integer PRIMARY KEY AUTOINCREMENT, `name` varchar(255), `cost` integer, `health_max` integer, `virility` integer, `light_min` integer, `water_consumption` integer, `layer_max` integer, `created_at` timestamp, `updated_at` timestamp, `image_path` varchar(255), `light_max` integer, `nutrients_consumption` integer, `vertical_rate` double precision, `radial_rate` double precision, `density_rate` double precision, `nutrients_tolerance` integer, `wetness_tolerance` integer, `nutrients_optimum` integer, `wetness_optimum` integer, `description` varchar(255), `thumbnail` varchar(255), `shadow_block` boolean DEFAULT 'f');
INSERT INTO "plant_templates" VALUES(1,'Cedar',100,100,50,10,20,2,'2012-02-01 07:08:57.000000+0000','2012-02-01 07:08:57.000000+0000','scaled-Tree1',30,8,8.0,5.0,5.0,8,20,8,30,NULL,'scaled-Tree1-thumb.png','t');
INSERT INTO "plant_templates" VALUES(2,'Blackberry',50,50,50,5,3,1,'2012-02-01 07:08:57.000000+0000','2012-02-01 07:08:57.000000+0000','Tree_48x48.png',5,3,5.0,5.0,5.0,5,5,5,10,NULL,'Tree_48x48.png','f');
INSERT INTO "plant_templates" VALUES(3,'Fern',10,10,10,1,2,1,'2012-02-01 07:08:57.000000+0000','2012-02-01 07:08:57.000000+0000','scaled-Fern',3,1,2.0,2.0,3.0,2,3,7,8,NULL,'scaled-Fern-thumb.png','f');
DROP TABLE IF EXISTS `mission_tag_category_mappings`;
CREATE TABLE `mission_tag_category_mappings` (`id` integer PRIMARY KEY AUTOINCREMENT, `mission_tag_id` integer, `mission_tag_category_id` integer, `created_at` timestamp, `updated_at` timestamp);
DROP TABLE IF EXISTS `mission_tags`;
CREATE TABLE `mission_tags` (`id` integer PRIMARY KEY AUTOINCREMENT, `mission_tag` varchar(255), `created_at` timestamp, `updated_at` timestamp);
DELETE FROM sqlite_sequence;
INSERT INTO "sqlite_sequence" VALUES('missions',31);
INSERT INTO "sqlite_sequence" VALUES('unlockable_plants',6);
INSERT INTO "sqlite_sequence" VALUES('grounds',11);
INSERT INTO "sqlite_sequence" VALUES('users',7);
INSERT INTO "sqlite_sequence" VALUES('world_missions',6);
INSERT INTO "sqlite_sequence" VALUES('signup_emails',2);
INSERT INTO "sqlite_sequence" VALUES('mission_statuses',21);
INSERT INTO "sqlite_sequence" VALUES('worlds',1);
INSERT INTO "sqlite_sequence" VALUES('plants',11);
INSERT INTO "sqlite_sequence" VALUES('sessions',44);
INSERT INTO "sqlite_sequence" VALUES('gardens',5);
INSERT INTO "sqlite_sequence" VALUES('plant_templates',3);

DROP INDEX IF EXISTS `index_users_on_reset_password_token`;
CREATE UNIQUE INDEX `index_users_on_reset_password_token` ON `users` (`reset_password_token`);
DROP INDEX IF EXISTS `unique_schema_migrations`;
CREATE UNIQUE INDEX `unique_schema_migrations` ON `schema_migrations` (`version`);
DROP INDEX IF EXISTS `index_sessions_on_session_id`;
CREATE INDEX `index_sessions_on_session_id` ON `sessions` (`session_id`);
DROP INDEX IF EXISTS `index_sessions_on_updated_at`;
CREATE INDEX `index_sessions_on_updated_at` ON `sessions` (`updated_at`);
COMMIT;