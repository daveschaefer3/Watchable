require 'spec_helper'

describe 'Main page' do
  it 'should have the tag line' do
    visit('/')
    page.should have_content('Movies worth watching')
  end
end