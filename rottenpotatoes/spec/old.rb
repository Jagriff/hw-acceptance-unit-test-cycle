require 'rails_helper'

describe Movie do
  let!(:movie1) {Factory.create(:movie, title: "Rocky IV", director: "Sylvester Stallone")}

  it 'director exists' do
    expect(Movie.has_director("Sylvester Stallone")).to eql(["Rocky IV"])
  end
end
