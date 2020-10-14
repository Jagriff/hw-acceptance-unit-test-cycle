require 'rails_helper'

# test controller method
describe MoviesController, :type => :controller do

  let!(:movie1) { FactoryGirl.create(:movie, title: 'Rocky IV', director: 'Sylvester Stallone', id: 1) }
  let!(:movie2) { FactoryGirl.create(:movie, title: 'King Kong', director: 'Peter Jackson', id: 2) }
  let!(:movie3) { FactoryGirl.create(:movie, title: "The Fellowship of the Ring", director: 'Peter Jackson', id: 3) }
  let!(:movie4) { FactoryGirl.create(:movie, title: "The Gladiator", id: 4) }


  context 'if there is a known director' do
    it 'should call the model method that finds movies with certain director' do
      Movie.should_receive(:has_director).with('Sylvester Stallone')
      get :similar, {id: 1}
    end

    it 'should assign movies to the result from Movie.has_director' do
      fake_results = [double(Movie), double(Movie), double(Movie)]
      Movie.stub(:has_director).and_return(fake_results)
      get :similar, {id: 1}
      assigns(:movies).should == fake_results
    end
  end

  context 'if there is no known director' do
    it 'should give an error message' do
      get :similar, {id: 4}
      flash[:notice].should eq("'The Gladiator' has no director info")
    end

    it 'should redirect' do
      get :similar, {id: 4}
      response.should redirect_to movies_path
    end
  end

end
