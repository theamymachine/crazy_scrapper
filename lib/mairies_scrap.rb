# Gems
require 'pry'
require 'nokogiri'
require 'open-uri'
# Scrapping townhall url to an array
def get_townhall_urls
  page = Nokogiri::HTML(open("https://www.annuaire-des-mairies.com/val-d-oise.html"))
  list_url = (page.xpath("//table//td/p/a[@class='lientxt']/@href"))
  list_url_array = []
  list_url.each {|i| list_url_array << i.text}
  list_url_array.map{|url| url[0]="https://www.annuaire-des-mairies.com"}
  return list_url_array
end
# Scrapping city name from page
def get_city_name
  list_city_name_array = []
  get_townhall_urls.each {|generate| page = Nokogiri::HTML(open(generate))
  list_city_name_array << page.xpath("//table//td/p/a/text()").text}
  # Return array for city name
  return list_city_name_array
end
# Scrapping email from page
def get_townhall_email
  emails_list = []
  get_townhall_urls.each {|generate| page = Nokogiri::HTML(open(generate))
  emails_list << page.xpath("//section[2]/div/table/tbody/tr[4]/td[2]/text()").text}
  #Return array for emails
  return emails_list
end
# Create hashes in Array
def create_hashes_in_array
  # Create a hash of names and emails
  city_hash=Hash[get_city_name.zip get_townhall_email]
  # Create array of hashes
  final_array = Array.new
  city_hash.each{|key, val|
  h = Hash.new
  h[key] = val
  final_array.push(h)}
  return final_array
end

puts 