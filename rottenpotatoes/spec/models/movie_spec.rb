require 'rails_helper'

# test model method
describe Movie do
  describe '.has_director' do
    let!(:movie1) { FactoryGirl.create(:movie, title: 'Rocky IV', director: 'Sylvester Stallone') }
    let!(:movie2) { FactoryGirl.create(:movie, title: 'King Kong', director: 'Peter Jackson') }
    let!(:movie3) { FactoryGirl.create(:movie, title: "The Fellowship of the Ring", director: 'Peter Jackson') }
    let!(:movie4) { FactoryGirl.create(:movie, title: "The Gladiator") }

    context 'director exists' do
      it 'finds movie records with specific director' do
        expect(Movie.has_director(movie1.director).pluck(:title)).to eq(['Rocky IV'])
        expect(Movie.has_director(movie2.director).pluck(:title)).to eql(['King Kong', 'The Fellowship of the Ring'])
      end
    end

    context 'director does not exist' do
      it 'handles sad path' do
        expect(Movie.has_director(movie4.director)).to eql(nil)
      end
    end
  end

end
