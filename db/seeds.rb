# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# countries dictionary
countries = [{:name => 'Afghanistan', :name_rus => ''},
             {:name => 'Albania', :name_rus => ''},
             {:name => 'Algeria', :name_rus => ''},
             {:name => 'American Samoa', :name_rus => ''},
             {:name => 'Andorra', :name_rus => ''},
             {:name => 'Angola', :name_rus => ''},
             {:name => 'Anguilla', :name_rus => ''},
             {:name => 'Antarctica', :name_rus => ''}
  	 ]

#countries.each do |country|
#  Country.create!(country)
#end

# domaine zones dictionary
domzones  = [{:zone_name => 'com'},
             {:zone_name => 'net'},
             {:zone_name => 'org'},
             {:zone_name => 'me'},
             {:zone_name => 'us'},
             {:zone_name => 'ca'},
             {:zone_name => 'in'},
             {:zone_name => 'cn'},
             {:zone_name => 'im'},
             {:zone_name => 'info'},
             {:zone_name => 'mx'},
             {:zone_name => 'sx'},
             {:zone_name => 'biz'},
             {:zone_name => 'tv'}
  	 ]
#domzones.each do |zone|
#  Domain_zone.create!(zone)
#end

# domaine states dictionary
domstates  = [{:state_name => 'checked'},
             {:state_name => 'in progress'},
             {:state_name => 'active'},
             {:state_name => 'postponed'},
             {:state_name => 'inactive'},
     ]
#domstates.each do |state|
#  Domain_state.create!(state)
#end