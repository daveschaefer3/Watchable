require 'spec_helper'

describe 'Upcoming page' do
  it 'should have the tag line' do
    visit('/upcoming')
    page.should have_content('Movies opening this week and soon after')
  end
end