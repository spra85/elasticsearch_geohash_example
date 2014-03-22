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

  describe "#same_center?" do
    let(:bounding_box1) { GeoHash.decode_bbox("dr5ru49f") }
    let(:bounding_box2) { GeoHash.decode_bbox("dr5ru4") }
    let(:bounding_box3) { GeoHash.decode_bbox("dr5r") }
    let(:bounding_box4) { GeoHash.decode_bbox("dr") }
    let(:boxes) { [bounding_box1, bounding_box2, bounding_box3, bounding_box4] }

    it "returns the same center point if same geo hash string but less precise" do
      center_points = Set.new
      boxes.each do |box_array|
        point1 = RGeo::Geographic.simple_mercator_factory.point(box_array.first.last, box_array.first.first)
        point2 = RGeo::Geographic.simple_mercator_factory.point(box_array.last.last, box_array.last.first)
        bounding_box = RGeo::Cartesian::BoundingBox.create_from_points(point1, point2)
        center_points.add([bounding_box.center_x, bounding_box.center_y])
      end
      puts center_points.inspect
      expect(center_points.size).to eq(1)
    end
  end
end