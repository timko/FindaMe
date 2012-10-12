# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users =  [{:name => 'Merriam', :email => 'Brandybuck@gmail.com', :password => 'studio'},
          {:name => 'Peregrin', :email => 'Took@gmail.com', :password => 'studio'},
    	  {:name => 'Racinda', :email => 'Jules@gmail.com', :password => 'studio'},
    	  {:name => 'Davy', :email => 'Grohlton@gmail.com', :password => 'studio'},
      	  {:name => 'Ned', :email => 'Bender@gmail.com', :password => 'studio'},
      	  {:name => 'Bill', :email => 'Golds@gmail.com', :password => 'studio'},
      	  {:name => 'Patton', :email => 'Smudge@gmail.com', :password => 'studio'},
      	  {:name => 'Ty', :email => 'Hawkstone@gmail.com', :password => 'studio'},
      	  {:name => 'Fritz', :email => 'Steel@gmail.com', :password => 'studio'},
      	  {:name => 'Christopher', :email => 'Mishomotohama@gmail.com', :password => 'studio'},
      	  {:name => 'Graham', :email => 'Jefferson@gmail.com', :password => 'studio'},
  	 ]

locations = [{:name => 'Berkeley', :latitude => 1.1, :longitude => 2.2},
             {:name => 'San Francisco', :latitude => 1.1, :longitude => 2.2},
             {:name => 'Eisengard', :latitude => 1.1, :longitude => 2.2},
             {:name => 'San Diego', :latitude => 1.1, :longitude => 2.2},
	    ]

users.each do |user|
  User.create(user)
end

locations.each do |location|
  Location.create(location)
end

berk_id = Location.find_by_name('Berkeley').id
eisen_id = Location.find_by_name('Eisengard').id
sd_id = Location.find_by_name('San Diego').id

m_id = User.find_by_name('Merriam').id
pe_id = User.find_by_name('Peregrin').id
r_id = User.find_by_name('Racinda').id
d_id = User.find_by_name('Davy').id
n_id = User.find_by_name('Ned').id
b_id = User.find_by_name('Bill').id
pa_id = User.find_by_name('Patton').id
t_id = User.find_by_name('Ty').id
f_id = User.find_by_name('Fritz').id
c_id = User.find_by_name('Christopher').id
g_id = User.find_by_name('Graham').id

checkins = [{:user_id => m_id, :location_id => eisen_id},
            {:user_id => pe_id, :location_id => eisen_id},
            {:user_id => r_id, :location_id => berk_id},
            {:user_id => d_id, :location_id => berk_id},
            {:user_id => n_id, :location_id => berk_id},
            {:user_id => b_id, :location_id => berk_id},
            {:user_id => pa_id, :location_id => berk_id},
            {:user_id => t_id, :location_id => berk_id},
            {:user_id => f_id, :location_id => sd_id},
            {:user_id => g_id, :location_id => sd_id},
            {:user_id => c_id, :location_id => sd_id},
           ]

checkins.each do |checkin|
  Checkin.create(checkin)
end
