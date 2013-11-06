require 'nekoime'

describe Nekoime do
  describe 'latest_id' do
    it 'should get latest_id' do
      Nekoime.latest_id.should be_an_instance_of(Fixnum)
    end
    it 'should raise RequestError for non-exist url' do
      Nekoime::BASE_URL = 'http://nekoimetest.net'
      lambda{ Nekoime.latest_id }.should raise_error(Nekoime::RequestError)
    end
    it 'should raise ParseError for wrong html' do
      Nekoime::BASE_URL = 'http://example.com'
      lambda{ Nekoime.latest_id }.should raise_error(Nekoime::ParseError)
    end
  end
end
