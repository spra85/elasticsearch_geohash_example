class ZipCodeSearch
  attr_accessor :precision, :query_hash

  def initialize(options = {})
    @precision = options[:precision] || 3
    @query_hash = {}
  end

  def build_query_hash
    query_hash[:aggregations] = build_aggregations
  end

  def results
    build_query_hash
    ZipCode.search(query_hash)
  end

  def build_aggregations
    aggregations = {}
    aggregations[:location_geohash_aggregate] = location_geohash_aggregate
    aggregations
  end

  def location_geohash_aggregate
    {
      geohash_grid: {
        field: :location,
        precision: precision
      }
    }
  end
end