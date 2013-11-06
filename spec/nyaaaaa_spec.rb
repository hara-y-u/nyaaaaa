# -*- coding: utf-8 -*-
require 'nyaaaaa'

describe Nyaaaaa do
  describe 'get_latest_id' do
    original_base_url = Nyaaaaa::BASE_URL
    after do
      Nyaaaaa::BASE_URL = original_base_url
    end
    it 'should get get_latest_id' do
      Nyaaaaa.get_latest_id.should be_an_instance_of(Fixnum)
    end
    it 'should raise RequestError for non-exist url' do
      lambda{
        Nyaaaaa::BASE_URL = 'http://nyaaaaatest.net'
        Nyaaaaa.get_latest_id
      }.should raise_error(Nyaaaaa::RequestError)
    end
    it 'should raise ParseError for wrong html' do
      lambda{
        Nyaaaaa::BASE_URL = 'http://example.com'
        Nyaaaaa.get_latest_id
      }.should raise_error(Nyaaaaa::ParseError)
    end
  end

  describe 'save_latest_id' do
    it 'should write latest_id' do
      Nyaaaaa.save_latest_id(2048)
      IO.read(Nyaaaaa.latest_id_cache_path).should eq('2048')
    end
  end

  describe 'latest_id' do
    it 'should return latest id' do
      Nyaaaaa.latest_id.should be_an_instance_of(Fixnum)
    end
  end

  describe 'url_with_id' do
    it 'should return url with id' do
      Nyaaaaa.url_with_id(123).should eq('http://ねこ画像.net/neko00123/')
    end
  end
end
