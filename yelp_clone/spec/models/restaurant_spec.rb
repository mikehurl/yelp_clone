require 'rails_helper'

describe Restaurant, type: :model do
  it "Is not valid with a name less that 3 characters" do
    r = Restaurant.new(name: 'KF')
    expect(r).to have(1).error_on(:name)
    expect(r).not_to be_valid
  end

  it "is not valid unless it has a unique name" do
    Restaurant.create(name: "Moe's Tavern")
    restaurant = Restaurant.new(name: "Moe's Tavern")
    expect(restaurant).to have(1).error_on(:name)
  end
  

end
