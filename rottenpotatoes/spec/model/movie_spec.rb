require 'rails_helper'

describe Movie do 
    let!(:movie1) {Movie.create(title: "Star Wars", director: "George Lucas")}
    let!(:movie2) {Movie.create(title: "Blade Runner", director: "Ridley Scott")}
    let!(:movie3) {Movie.create(title: "Alien")}
    let!(:movie4) {Movie.create(title: "THX-1138", director: "George Lucas")}

    describe '.same_directors' do
        it 'when find movies by same director' do
            expect(Movie.same_directors(movie1.director)).to eql([movie1, movie4])
        end

        it 'when find movies by different director' do
            expect(Movie.same_directors(movie1.director)).to_not include([movie2, movie3])
        end

        it 'when find movies without director info' do
            expect(Movie.same_directors(movie3.director)).to eql(nil)
        end
    end

    describe '.all_ratings' do
        it 'returns all ratings' do
          expect(Movie.all_ratings).to match(%w(G PG PG-13 NC-17 R))
        end
    end
end