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
domzones  = [{:zone_name => 'com', :price => 10.0},
             {:zone_name => 'net', :price => 10.0},
             {:zone_name => 'org', :price => 10.0},
             {:zone_name => 'me', :price => 10.0},
             {:zone_name => 'us', :price => 10.0},
             {:zone_name => 'ca', :price => 10.0},
             {:zone_name => 'in', :price => 10.0},
             {:zone_name => 'cn', :price => 10.0},
             {:zone_name => 'im', :price => 10.0},
             {:zone_name => 'info', :price => 10.0},
             {:zone_name => 'mx', :price => 10.0},
             {:zone_name => 'sx', :price => 10.0},
             {:zone_name => 'biz', :price => 10.0},
             {:zone_name => 'tv', :price => 10.0}
  	 ]
#domzones.each do |zone|
#  DomainZone.create!(zone)
#end

# domaine states dictionary
domstates  = [{:state_name => 'checked'},
             {:state_name => 'in progress'},
             {:state_name => 'active'},
             {:state_name => 'postponed'},
             {:state_name => 'inactive'},
     ]
#domstates.each do |state|
#  DomainState.create!(state)
#end

params  = [{:params => 'dynadot_api_key', :values => '7U6B736c6S6i8q6u9G73i6oQ6L8BQ'},
           {:params => 'ns1_default', :values => 'ns1.uhost.com.ua'},
           {:params => 'ns2_default', :values => 'ns2.uhost.com.ua'}
     ]
#params.each do |param|
#  Param.create!(param)
#end