class NasaSearchService

  def initialize(start_date, end_date)
    @start_date = start_date
    @end_date = end_date
  end

  def stringify_time(time)
    Time.parse(time).strftime('%Y-%m-%d')
  end

  private

    def get_url(url)
      response = conn.get(url)
      JSON.parse(response.body, symbolize_names: true)
    end

    def headers
      {

      }
    end

    def conn
      Faraday.new(url: )
    end
end
