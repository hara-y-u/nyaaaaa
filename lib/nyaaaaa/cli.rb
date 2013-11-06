require 'nyaaaaa'
require 'launchy'
require 'thor'

module Nyaaaaa
  class CLI < Thor
    desc 'update', 'update to latest image data'
    def update
      puts 'Update latest id to: ' + Nyaaaaa.fetch_latest_id.to_s
    end

    desc 'nyaaaaa', 'Nyaaaaaaaaaaaaaaaaaaaaaaaaaaaa!'
    def nyaaaaa
      Launchy.open Nyaaaaa.random_url
    end
    default_task :nyaaaaa
  end
end
