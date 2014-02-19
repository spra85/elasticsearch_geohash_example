class GeoHashConverter
  attr_reader :geohash_string

  def initialize(geohash_string)
    @geohash_string = geohash_string
  end

  def bounding_box_coordinates
    @bounding_box ||= GeoHash.decode_bbox(geohash_string)
  end

  def polygonal_coordinates
    bottom_left = bounding_box_coordinates.first
    top_right = bounding_box_coordinates.last

    top_left = [top_right.first, bottom_left.last]
    bottom_right = [bottom_left.first, top_right.last]

    [
      top_left,
      top_right,
      bottom_right,
      bottom_left
    ]
  end
end