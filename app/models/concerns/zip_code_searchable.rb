module ZipCodeSearchable
  extend ActiveSupport::Concern

  included do
    include Elasticsearch::Model
    include Elasticsearch::Model::Callbacks

    mapping do
      indexes :id, type: :integer
      indexes :zip, type: :string
      indexes :city, type: :string
      indexes :state, type: :string
      indexes :zip_class, type: :string
      indexes :county, type: :string
      indexes :location, type: :geo_point, lat_lon: true, geo_hash: true
      indexes :created_at, type: :date
      indexes :updated_at, type: :date
    end

    def as_indexed_json(options = {})
      as_json(methods: [:location])
    end

    def location
      {
        lat: latitude,
        lon: longitude
      }
    end
  end
end