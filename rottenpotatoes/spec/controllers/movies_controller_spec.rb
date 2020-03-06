require 'rails_helper'

describe MoviesController do
    let!(:movie1) {Movie.create(id: 1, title: "Star Wars", director: "George Lucas")}
    let!(:movie2) {Movie.create(id: 2, title: "Blade Runner", director: "Ridley Scott")}
    let!(:movie3) {Movie.create(id: 3, title: "Alien")}
    let!(:movie4) {Movie.create(id: 4, title: "THX-1138", director: "George Lucas")}

    describe 'GET similar' do
        it 'movie has direcotr, should' do
            get :similar, id: movie1[:id]
            expect(response).to render_template(:similar)
        end

        it 'movie has no direcor, should' do
            get :similar, id: movie3[:id]
            expect(response).to redirect_to(movies_path)
        end
    end

    describe 'GET index' do
        it 'should render the index template' do
            get :index
            expect(response).to render_template(:index)
        end
    
        context 'when I click header' do
            it 'should be highlight when sorted by title header' do
                get :index, { sort: 'title'}
                expect(assigns(:title_header)).to eql('bg-warning hilite')
            end
        
            it 'should be highlight when sorted by release_date header' do
                get :index, { sort: 'release_date'}
                expect(assigns(:date_header)).to eql('bg-warning hilite')
            end
        end
    end

    describe 'POST #create' do
        let(:params) {{id: 4, title: "THX-1138", director: "George Lucas"}}
        it 'creates a new movie' do
            post :create, {movie: params}
            expect(response).to redirect_to(movies_path)
        end
    end

    describe 'DELETE #destroy' do
        it 'destroys a movie' do
          expect { delete :destroy, id: movie1.id
          }.to change(Movie, :count).by(-1)
        end
    
        it 'redirects to movies#index after destroy' do
          delete :destroy, id: movie1.id
          expect(response).to redirect_to(movies_path)
        end
      end
end