class WikiScraper < Scraper

  def initialize options={}
    @agent = Mechanize.new
    @base_url = "https://he.wikipedia.org/wiki/"
    @main_element = "#mw-content-text ul"
    @nested_element = "li"
    @lists_index = {historic: 2, born: 3, died: 4, events: 5}
    @current_year = Time.new.year
    super
  end

  def scrap
    @date = self.category.broadcast.air_time
    results = fetch
    @lists_index.each do |list, index|
      @content[list] = results[index].search(@nested_element).map do |element|
        parse element.text, list
      end
    end
  end


  private

  def date_formatter
    "#{self.category.broadcast.air_time.day}_#{months[self.category.broadcast.air_time.month]}"
  end

  def build_url
    @url = @base_url + date_formatter
  end

  def parse element ,context
    if context != :events
      element = element.split('-', 2)
      year = element[0].strip
      years_ago = @current_year - element[0].to_i
      text = element[1].reverse
      "(#{years_ago} years ago) #{text} (in the year #{year})"
    else
      element.reverse
    end
  end

  def months
    [
      "blank",
      "%D7%91%D7%99%D7%A0%D7%95%D7%90%D7%A8",
      "%D7%91%D7%A4%D7%91%D7%A8%D7%95%D7%90%D7%A8",
      "%D7%91%D7%9E%D7%A8%D7%A5",
      "%D7%91%D7%90%D7%A4%D7%A8%D7%99%D7%9C",
      "%D7%91%D7%9E%D7%90%D7%99",
      "%D7%91%D7%99%D7%95%D7%A0%D7%99",
      "%D7%91%D7%99%D7%95%D7%9C%D7%99",
      "%D7%91%D7%90%D7%95%D7%92%D7%95%D7%A1%D7%98",
      "%D7%91%D7%A1%D7%A4%D7%98%D7%9E%D7%91%D7%A8",
      "%D7%91%D7%A0%D7%95%D7%91%D7%9E%D7%91%D7%A8",
      "%D7%91%D7%90%D7%95%D7%A7%D7%98%D7%95%D7%91%D7%A8",
      "%D7%91%D7%93%D7%A6%D7%9E%D7%91%D7%A8"
    ]
  end

end