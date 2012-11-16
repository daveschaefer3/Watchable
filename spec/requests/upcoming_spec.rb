require 'spec_helper'

describe 'Upcoming page' do
  it 'Upcoming releases should get a response' do
    Upcoming.upcoming_movies.should_not be_empty
  end

  it 'Opening releases should get a response' do
    Upcoming.opening_movies.should_not be_empty
  end

  it 'Upcoming response should get get appropriate upcoming-film data' do
    response = Upcoming.upcoming_movies
    response.first['title'].should_not be_empty
    response.first['release_dates']['theater'].should match(/^\d{4}-\d{2}-\d{2}$/)
    response.first['ratings']['audience_score'].to_s.should match(/^\d{1,3}+$/i)
    response.first['posters']['thumbnail'].should match(/^http:\/\//)
    response.first['alternate_ids']['imdb'].should match(/^\d{7}+$/i)
  end

  it 'Opening response should get get appropriate opening-film data' do
    response = Upcoming.opening_movies
    response.first['title'].should_not be_empty
    response.first['release_dates']['theater'].should match(/^\d{4}-\d{2}-\d{2}$/)
    response.first['ratings']['audience_score'].to_s.should match(/^\d{1,3}+$/i)
    response.first['posters']['thumbnail'].should match(/^http:\/\//)
    response.first['alternate_ids']['imdb'].should match(/^\d{7}+$/i)
  end

  it 'should have the tag line' do
    visit('/upcoming')
    page.should have_content('Movies opening this week and soon after')
  end
end