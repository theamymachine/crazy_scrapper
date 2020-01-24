require_relative '../lib/dark_trader'
describe "the scrapping_page method" do
  # Not nil
  it "should return array not nil" do
    expect(scrapping_page).not_to be_nil
  end
  # Returns array
  it "should return an array of little hashes" do
    expect(scrapping_page).to be_an_instance_of(Array)
  end
end
describe "the create_hashes_in_array method" do
	# Values returned
  it "should include the specific result" do
    expect(create_hashes_in_array.first.keys[0]).to match("BTC")
	end
	# There is something in the array
	it "should be greater than 10" do
		expect(create_hashes_in_array.size).to be > 10
  end
end