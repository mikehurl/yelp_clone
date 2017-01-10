require 'rails_helper'

describe Restaurant, type: :model do
  it "Is not valid with a name less that 3 characters" do
    r = Restaurant.new(name: 'KF')
    expect(r).to have(1).error_on(:name)
    expect(r).not_to be_valid
  end
end  
