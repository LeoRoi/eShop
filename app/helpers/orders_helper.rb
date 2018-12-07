module OrdersHelper

  def google_maps_api
    # insert bought key here
    "#{google_maps_api_url}/api/js?key=#{google_maps_api_key}&libraries=places&callback=initAutocomplete"
  end

  private

  # returns the google maps api key
  def google_maps_api_key
    ENV['GOOGLE_MAPS_API_KEY']
  end

  # returns the API url from the Google Maps API v3
  def google_maps_api_url
    'https://maps.googleapis.com/maps'
  end
end
