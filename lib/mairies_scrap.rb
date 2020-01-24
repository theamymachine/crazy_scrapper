# Gem
require 'pry'
require 'nokogiri'
require 'open-uri'
# Url of page to scrapp
PAGE_URL = "https://coinmarketcap.com/all/views/all/"
#Isolate HTML and create array
def scrapping_page
  page = Nokogiri::HTML(open(PAGE_URL))
  # Isolation of HTML element
  crypto_names = page.xpath("/html/body/div/div/div[2]/div[1]/div[2]/div[2]/div[2]/div[3]/div/table/tbody//td[3]/div/text()")
  crypto_prices = page.xpath("/html/body/div/div/div[2]/div[1]/div[2]/div[2]/div[2]/div[3]/div/table/tbody//td[5]//a/text()")
  # Create array for names
  crypto_names_array=Array.new
  crypto_names.each{ |i| crypto_names_array << i.text}
  # Create array for prices
  crypto_prices_array=Array.new
  crypto_prices.each{ |i| crypto_prices_array << i.text}
  # Return Array with 2 array(names and prices)
  return[crypto_names_array, crypto_prices_array] 
end
# Create an Hash with the 2 Array
def create_hashes_in_array
  # Create a hash of names and prices
  crypto_hash=Hash[scrapping_page[0].zip scrapping_page[1]]
  # Create array of hashes
  final_array=Array.new
  crypto_hash.each{|key, val|
    h=Hash.new
    h[key]=val
    final_array.push(h)}
  return final_array
end
# Launcher
#pp create_hashes_in_array