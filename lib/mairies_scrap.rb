require 'pry'
require 'nokogiri'
require 'open-uri'
#Scrapping townhall url to an array
def get_townhall_urls
page = Nokogiri::HTML(open("https://www.annuaire-des-mairies.com/val-d-oise.html"))
list_url = (page.xpath("//table//td/p/a[@class='lientxt']/@href"))
list_url_array = []
list_url.each {|i| list_url_array << i.text}
list_url_array.map{|url| url[0]="https://www.annuaire-des-mairies.com"}
return list_url_array
end
#Scrapping email from page
def get_townhall_email(list_url_array)
emails_list = []
list_url_array.each {|generate| page = Nokogiri::HTML(open(generate))
emails_list << page.xpath("//section[2]/div/table/tbody/tr[4]/td[2]/text()").text}
return emails_list
end
#Scrapping city name from page
def get_city_name(list_url_array)
  city_name_list = []
  list_url_array.each {|generate| page = Nokogiri::HTML(open(generate))
  city_name_list << page.xpath("//div/main/section[1]/div/div/div/h1/text()").text}
  return city_name_list
end
#city names from page 
def get_city_name(list_url_array)
  city_name_list = []
  list_url_array.each {|generate| page = Nokogiri::HTML(open(generate))
  city_name_list << page.xpath("//div/main/section[1]/div/div/div/h1/text()").text}
  return city_name_list
end
#final array with hashes inside 
def final_table (hash)
  a = []
  hash.each{|key, val|
  h = Hash.new
  h[key] = val
  a.push(h)
  }
  return a
end

table = final_table(get_city_name, get_townhall_email)

print table