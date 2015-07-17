require 'open-uri'
require 'active_support/core_ext/hash'
require 'logger'
require 'erb'
require 'nokogiri'

require './node.rb'
require './way.rb'
require './relation.rb'

require './journey/vertex.rb'
require './journey/edge.rb'
require './journey/journey.rb'

$logger = Logger.new(STDOUT)  
$logger.level = Logger::INFO

#the script can only process one route at a time 
#can be fixed but not sure how 

r = Osm::Relation.new(1532102)
r.load
r.determine_interconnections
r.to_html

j = Osm::Journey.new r
j.generate_journey
j.to_html
puts j.to_gpx
