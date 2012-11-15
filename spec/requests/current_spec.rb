require 'spec_helper'

describe 'Main page' do
  it 'should get a response' do
    Current.get_response.should_not be_empty
  end

  it 'should get a response containing the KIND OF data we need' do
    response = Current.get_response
    response.first['id'].should match(/^\d+$/i)
    response.first['title'].should_not be_empty
    response.first['ratings']['critics_score'].to_s.should match(/^\d{1,3}+$/i)
    response.first['ratings']['audience_score'].to_s.should match(/^\d{1,3}+$/i)
    response.first['posters']['detailed'].should match(/^http:\/\//)
    response.first['critics_consensus'].should_not be_empty
    response.first['alternate_ids']['imdb'].should match(/^\d{7}+$/i)
  end

  it 'should have the tag line' do
    visit('/')
    page.should have_content('Movies worth watching')
  end
end