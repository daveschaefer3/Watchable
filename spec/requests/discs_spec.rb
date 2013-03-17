require 'spec_helper'

describe 'Upcoming page' do
  it 'Current disc releases should get a response' do
    Disc.releases('current_releases').should_not be_empty
  end

  it 'Upcoming disc releases should get a response' do
    Disc.releases('new_releases').should_not be_empty
  end

  it 'should have the tag line' do
    visit('/discs')
    page.should have_content('DVD and Blu-ray releases')
  end
end