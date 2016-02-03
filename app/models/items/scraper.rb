require 'mechanize'
class Scraper < Item

  def initialize options={}
    @agent = Mechanize.new
    @content = {}
    super
  end

  def data
    @content
  end


  protected

  def fetch
    build_url
    puts "url: #{@url}"
    @agent.get(@url).search(@main_element)
  end

end