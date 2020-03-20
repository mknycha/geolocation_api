require 'rails_helper'

describe '#POST /api/geolocations', type: 'request' do
  let(:geolocation_params) do
    {
      ip: Faker::Internet.ip_v6_address,
      ip_type: 'ipv6',
      country: 'Poland',
      city: 'Bzdziszewo',
      latitude: 52.41360092163086,
      longitude: 16.837390899658203
    }
  end
  let(:params) do
    { geolocation: geolocation_params }
  end
  let(:action) { post '/api/geolocations', params: params }

  it 'returns http status ok' do
    action
    expect(response).to have_http_status(:ok)
  end

  it 'creates a record' do
    expect { action }.to change(Geolocation, :count).by(1)
  end

  context 'with ip v4 address' do
    before do
      geolocation_params[:ip] = Faker::Internet.ip_v4_address
      geolocation_params[:ip_type] = 'ipv4'
    end

    it 'returns http status ok' do
      action
      expect(response).to have_http_status(:ok)
    end

    it 'creates a record' do
      expect { action }.to change(Geolocation, :count).by(1)
    end
  end

  context 'with a missing param' do
    before do
      geolocation_params[:city] = nil
    end

    it 'returns http status unprocessable entity' do
      action
      expect(response).to have_http_status(:unprocessable_entity)
    end

    it 'returns a proper error message' do
      action
      expect(JSON.parse(response.body).dig('errors', 'city')).to include(
        'can\'t be blank'
      )
    end
  end

  context 'with a invalid ip address param' do
    before do
      geolocation_params[:ip] = 'ug::ab::ug::a'
    end

    it 'returns http status unprocessable entity' do
      action
      expect(response).to have_http_status(:unprocessable_entity)
    end

    it 'returns a proper error message' do
      action
      expect(JSON.parse(response.body).dig('errors', 'ip')).to include(
        'is invalid'
      )
    end
  end
end
