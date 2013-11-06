require 'nekoime'

describe Nekoime do
  describe 'get_latest_id' do
    it 'should get get_latest_id' do
      Nekoime.get_latest_id.should be_an_instance_of(Fixnum)
    end
    it 'should raise RequestError for non-exist url' do
      Nekoime::BASE_URL = 'http://nekoimetest.net'
      lambda{ Nekoime.get_latest_id }.should raise_error(Nekoime::RequestError)
    end
    it 'should raise ParseError for wrong html' do
      Nekoime::BASE_URL = 'http://example.com'
      lambda{ Nekoime.get_latest_id }.should raise_error(Nekoime::ParseError)
    end
  end

  describe 'save_latest_id' do
    it 'should write latest_id' do
      Nekoime.save_latest_id(2048)
      IO.read(Nekoime.latest_id_cache_path).should eq('2048')
    end
  end
end
