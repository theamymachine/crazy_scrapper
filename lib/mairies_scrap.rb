require 'nokogiri'
require 'open-uri'
require 'pry'

#Scrapping information from page to arrays
#def scrapping_page
def get_townhall_email
page = Nokogiri::HTML(open("https://www.annuaire-des-mairies.com/95/avernes.html"))
list_emails = []
list_emails << page.xpath("//section[2]/div/table/tbody/tr[4]/td[2]/text()")
end

puts get_townhall_email

#/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]
#get_townhall_urls

page = Nokogiri::HTML(open("https://www.annuaire-des-mairies.com/val-d-oise.html"))

def get_townhall_url
  list_url = (page.xpath("//table//td/p/a[@class='lientxt']/@href"))
  list_url_array = []
  list_url.each{ |i| list_url_array << i.text}
  return list_url_array
end

get_townhall_url(page)
