# -*- coding: utf-8 -*-
require "nekoime/version"
require 'addressable/uri'
require 'open-uri'
require 'nokogiri'

module Nekoime
  BASE_URL = Addressable::URI.parse("http://ねこ画像.net/")
  XPATH_LATEST_LINK = '//*[@id="content"]/div[1]/a'
  GEM_ROOT = Gem::Specification.find_by_name('nekoime').gem_dir

  class RequestError < StandardError
  end
  class ParseError < StandardError
  end

  module ModuleMethods
    def get_html
      begin
        url = Addressable::URI.parse(BASE_URL)

        charset = nil
        html = open(url.normalize.to_s) do |f|
          charset = f.charset
          f.read
        end
        [html, charset]
      rescue
        raise RequestError, "Request to #{BASE_URL} has failed."
      end
    end

    def scrape_latest_id(html, charset)
      begin
        doc = Nokogiri::HTML.parse(html, nil , charset)
        href = nil
        doc.xpath(XPATH_LATEST_LINK).each do |node|
          href = node.attribute('href').value
        end
        href.match(/\/neko(\d+)\//)[1].to_i
      rescue
        raise ParseError, "Parsing response HTML has failed."
      end
    end

    def get_latest_id
      scrape_latest_id(*get_html)
    end

    def var_dir
      File.join GEM_ROOT, 'var'
    end

    def latest_id_cache_path
      File.join var_dir, 'latest_id'
    end

    def save_latest_id(id)
      unless File.exists? var_dir
        FileUtils.mkdir var_dir
      end
      IO.write(latest_id_cache_path, id.to_s)
    end

    def fetch_latest_id
      save_latest_id(get_latest_id)
    end

    def latest_url
    end

    def random_url
    end
  end

  extend ModuleMethods
end
