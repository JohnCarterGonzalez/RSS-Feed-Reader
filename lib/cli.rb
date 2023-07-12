require 'pastel'

# controls the out to the cli from the rss_reader file 
# uses pastel to 
class Cli 
  def initialize(news)
    @news = news
  end

  def print_to_cli
    pastel = Pastel.new
    puts pastel.decorate("#{@news.title} :: #{@news.channel_title}", :bold, :green)
    puts pastel.blue.underline(@news.link)
    puts
    puts pastel.white(@news.description.to_s.remove_html_tags)
    puts
    puts pastel.yellow(@news.date)
    puts "=" * 50
    puts "\n" * 2
  end
end