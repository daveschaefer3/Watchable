require 'spec_helper'

describe 'Upcoming page' do
  it 'should have the tag line' do
    visit('/discs')
    page.should have_content('DVD and Blu-ray releases')
  end
end