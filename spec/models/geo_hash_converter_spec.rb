require "spec_helper"

describe GeoHashConverter do
  let(:geohash){ "9zm" }
  let(:subject){ GeoHashConverter.new(geohash) }

  describe "#bounding_box_coordinates" do
    it "returns bounding box for a geohash string" do
      expect(subject.bounding_box_coordinates).to eq([
        [40.78125, -94.21875], [42.1875, -92.8125]
      ])
    end
  end

  describe "#polygonal_coordinates" do
    it "returns longitudinal coordinates of a rectangle based on bounding box" do
      expect(subject.polygonal_coordinates).to eq([
        [42.1875, -94.21875],
        [42.1875, -92.8125],
        [40.78125, -92.8125],
        [40.78125, -94.21875]
      ])
    end
  end
end