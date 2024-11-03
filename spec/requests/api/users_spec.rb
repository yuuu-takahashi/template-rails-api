require 'rails_helper'

RSpec.describe 'UserAPI' do
  it '全てのUserを取得する' do
    create_list(:user, 10)
    get '/api/users'

    expect(response.status).to eq(200)
    json = JSON.parse(response.body)
  end
end