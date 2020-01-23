require_relative '../lib/dark_trader.rb'
require 'spec_helper'

describe "crypto_symbols" do 
  it "should scrap the symbols of virtual currencies in a webpage and return them in an array"
  expect (crypto_symbols).to eq ([])
end 
