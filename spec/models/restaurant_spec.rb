describe 'restaurant validations' do

  before do
    visit '/'
    click_link('Sign up')
    fill_in('Email', with: 'test@example.com')
    fill_in('Password', with: 'testtest')
    fill_in('Password confirmation', with: 'testtest')
    click_button('Sign up')
  end

  it 'is not valid with a name of less than three characters' do
    visit '/restaurants'
    click_link 'Add a restaurant'
    fill_in 'Name', with: 'KF'
    click_button 'Create Restaurant'
    expect(restaurant).to have(1).error_on(:name)
    expect(restaurant).not_to be_valid
  end

  it "is not valid unless it has a unique name" do
    visit '/restaurants'
    click_link 'Add a restaurant'
    fill_in 'Name', with: "Moe's Tavern"
    click_button 'Create Restaurant'
    restaurant = Restaurant.new(name: "Moe's Tavern")
    expect(restaurant).to have(1).error_on(:name)
  end
end

describe 'reviews' do
  describe 'build_with_user' do

    let(:user) { User.create email: 'test@test.com' }
    let(:restaurant) { Restaurant.create name: 'Test' }
    let(:review_params) { {rating: 5, thoughts: 'yum'} }

    subject(:review) { restaurant.reviews.build_with_user(review_params, user) }

    it 'builds a review' do
      expect(review).to be_a Review
    end

    it 'builds a review associated with the specified user' do
      expect(review.user).to eq user
    end
  end
end
