class SearchController < ApplicationController
  def index
    results = ZipCodeSearch.new.results
    geohash_buckets = results.response["aggregations"]["location_geohash_aggregate"]["buckets"]

    @geohash_data = geohash_buckets.map do |bucket|
      converter = GeoHashConverter.new(bucket["key"])

      {
        coordinates: converter.polygonal_coordinates,
        count: bucket["doc_count"]
      }
    end
  end
end
