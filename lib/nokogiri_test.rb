
require 'rubygems'
require 'nokogiri'
require 'open-uri'

page = Nokogiri::HTML(open("http://ruby.bastardsbook.com/files/hello-webpage.html"))   

news_links = page.css("div#references a")
puts page.css

news_links.each{|link| puts "#{link.text}\t#{link['href']}"}            
