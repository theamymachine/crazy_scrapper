require_relative '../lib/mairiechristmas'
describe "the get_townhall_urls method" do
  # Not nil
  it "should return array not nil" do
    expect(get_townhall_urls).not_to be_nil
  end
  # Returns array
  it "should return an array of little hashes" do
    expect(get_townhall_urls).to be_an_instance_of(Array)
  end
end
describe "the get_townhall_email method" do
  # Not nil
  it "should return array not nil" do
    expect(get_townhall_email).not_to be_nil
  end
  # Returns array
  it "should return an array of little hashes" do
    expect(get_townhall_email).to be_an_instance_of(Array)
  end
end
describe "the get_city_name method" do 
  # Not nil
  it "should return array not nil" do
    expect(get_city_name).not_to be_nil
  end
  # Returns array
  it "should return an array of little hashes" do
    expect(get_city_name).to be_an_instance_of(Array)
  end
end
describe "the create_hashes_in_array method" do
	# Values returned
	it "should include the specific result" do
		expect(create_hashes_in_array.first.key[0]).to match("ABLEIGES")
	end
	# There is something in the array
	it "should be greater than 10" do
		expect(create_hashes_in_array.size).to be > 10
  end
end
