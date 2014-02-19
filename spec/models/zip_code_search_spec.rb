require "spec_helper"

describe ZipCodeSearch do
  describe "#build_query_hash" do
    before do
      subject.build_query_hash
    end

    it "returns a baseline geohash aggregation by default" do
      expect(subject.query_hash).to eq({
        aggregations: {
          location_geohash_aggregate: {
            geohash_grid: {
              field: :location,
              precision: 3
            }
          }
        }
      })
    end
  end
end