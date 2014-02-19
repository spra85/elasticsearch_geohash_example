class CreateZipCodes < ActiveRecord::Migration
  def change
    create_table :zip_codes do |t|
      t.string :zip
      t.float :latitude
      t.float :longitude
      t.string :city
      t.string :state
      t.string :county
      t.string :zip_class

      t.timestamps
    end
  end
end