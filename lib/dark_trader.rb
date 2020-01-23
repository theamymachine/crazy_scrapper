require 'nokogiri'
require 'open-uri'
require 'pry'

def crypto_symbols(page)
  crypto_symbols_array = []
  page.xpath("/html/body/div/div/div[2]/div[1]/div[2]/div[2]/div[2]/div[3]/div/table/tbody/tr//td[3]/div").each do |name|
  crypto_symbols_array << name.text 
  end
  return crypto_symbols_array
end

def crypto_price(page)
  crypto_price_array = []
  page.xpath("/html/body/div/div/div[2]/div[1]/div[2]/div[2]/div[2]/div[3]/div/table/tbody/tr//td[5]/a/text()").each do |price|
  crypto_price_array << price.text 
 end
 return crypto_price_array
end 

def proper_format (hash)
  a = []
  hash.each{|key, val|
  h = Hash.new
  h[key] = val
  a.push(h)
  }
  return a
end

page_ref = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))

crypto_hash_table = Hash[crypto_symbols(page_ref).zip(crypto_price(page_ref))]

table = proper_format(crypto_hash_table)

print table



