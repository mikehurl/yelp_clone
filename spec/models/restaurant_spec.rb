require 'rails_helper'

RSpec.describe Restaurant, type: :model do

  it "is not valid with a name of less than three characters" do
    restaurant = Restaurant.create(name: "kf")
    expect(restaurant).to have(1).errors
  end

  it "is not valid unless it has a unique name" do
    Restaurant.create(name: "Moe's Tavern")
    restaurant = Restaurant.create(name: "Moe's Tavern")
    expect(restaurant).to have(1).errors
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

  describe '#average_rating' do
    context 'no reviews' do
      it 'returns "N/A" when there are no reviews' do
        restaurant = Restaurant.create(name: 'The Ivy')
        expect(restaurant.average_rating).to eq 'N/A'
      end
    end

    context '1 review' do
      it 'returns that rating' do
        restaurant = Restaurant.create(name: 'The Ivy')
        restaurant.reviews.create(rating: 4)
        expect(restaurant.average_rating).to eq 4
      end
    end

    context 'multiple reviews' do
      it 'returns the average' do
        User.create( id: 1, email: "test1@test.com", password: "test123")
        User.create( id: 2, email: "test2@test.com", password: "test123")
        restaurant = Restaurant.create(name: 'The Ivy', user_id: 1)
        restaurant.reviews.create(rating: 5, user_id: 1)
        restaurant.reviews.create(rating: 1, user_id: 2)
        expect(restaurant.average_rating).to eq 3
      end
    end

  end

end
