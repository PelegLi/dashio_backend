class ChartsScraper < Scraper

  def initialize options={}
    @base_url = "http://www.officialcharts.com/charts/uk-top-40-singles-chart/"
    @main_element = ".title-artist"
    @url_params = "/750140"
    super
  end

  def scrap
    @date = self.category.broadcast.air_time
    results = fetch
    @content = results.map do |result|
      parse result
    end
  end


  private

  def date_formatter
    self.category.broadcast.air_time.strftime("%Y%m%d")
  end

  def build_url
    @url = @base_url + date_formatter + @url_params
  end

  def parse element
    element.search('.artist a').text + " - " + element.search('.title a').text
  end

end