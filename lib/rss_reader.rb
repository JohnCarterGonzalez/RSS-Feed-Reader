require 'rss'
require 'open-uri'

def process_args(args)
  batch = []

  if valid_url?(args) && args.length > 1 
    batch.push(args)
  else
    puts "Invalid URL"
  end

  batch.each do |url|
    parse_url(url)
  end
end

def valid_url?(url)
  url =~ URI::regexp
end

def parse_url(url)
  URI.open(url) do |rss|
    feed = RSS::Parser.parse(rss)
    puts "/n"
    puts "Title: #{feed.channel.title}"
    puts "Description: #{feed.channel.description}"
    puts "Link: #{feed.channel.link}"
  end

  rescue OpenURI::HTTPError
    puts "Could not open URL"
end

ARGV.each {|opts| process_args(opts)}
