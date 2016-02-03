require 'mechanize'
class Scraper < Item

  def data
    scrap
    super @content
  end


  protected

  def set_variables
    @agent = Mechanize.new
    @content = {}
  end

  def fetch
    build_url
    puts "url: #{@url}"
    @agent.get(@url).search(@main_element)
  end

end