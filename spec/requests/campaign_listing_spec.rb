# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Campaign Listings', type: :request do
  it 'list recent four online campaigns' do
    get '/'
  end

  it 'list all online success failed campaign' do
  end

  it 'list all user created campaign' do
  end

  it 'list all user contributed campaign' do
  end
end
