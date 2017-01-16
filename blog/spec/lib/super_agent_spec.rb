require 'spec_helper'
require './lib/super_agent'

describe SuperAgent do
  describe '#retrieve_posts' do
    it 'returns posts' do
      stub_request(:get, "http://localhost:5000/posts").
        with(headers: {Accept:'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Faraday v0.10.1'}).
        to_return(status: 200, body:"{\"posts\":{\"posts\":[{\"id\":1,\"author_id\":\"1\",\"content\":\"blah\"}],\"authors\":[{\"id\":1,\"name\":\"Author1\",\"city\":\"MDE\",\"birth_date\":\"1990-01-15\"}]}}", headers: {})
      agent = SuperAgent.retrieve_posts
      # TODO: Fix that triple :posts key
      expect(agent[:posts][:posts][:posts]).to eq([{ id: 1, author_id: '1', content: 'blah'}])
    end
  end
end
