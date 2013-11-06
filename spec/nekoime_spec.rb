# -*- coding: utf-8 -*-
require 'nekoime'

describe Nekoime do
  describe 'get_latest_id' do
    original_base_url = Nekoime::BASE_URL
    after do
      Nekoime::BASE_URL = original_base_url
    end
    it 'should get get_latest_id' do
      Nekoime.get_latest_id.should be_an_instance_of(Fixnum)
    end
    it 'should raise RequestError for non-exist url' do
      lambda{
        Nekoime::BASE_URL = 'http://nekoimetest.net'
        Nekoime.get_latest_id
      }.should raise_error(Nekoime::RequestError)
    end
    it 'should raise ParseError for wrong html' do
      lambda{
        Nekoime::BASE_URL = 'http://example.com'
        Nekoime.get_latest_id
      }.should raise_error(Nekoime::ParseError)
    end
  end

  describe 'save_latest_id' do
    it 'should write latest_id' do
      Nekoime.save_latest_id(2048)
      IO.read(Nekoime.latest_id_cache_path).should eq('2048')
    end
  end

  describe 'latest_id' do
    it 'should return latest id' do
      Nekoime.latest_id.should be_an_instance_of(Fixnum)
    end
  end

  describe 'url_with_id' do
    it 'should return url with id' do
      Nekoime.url_with_id(123).should eq('http://ねこ画像.net/neko00123/')
    end
  end
end
