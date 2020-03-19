class CreateGeolocations < ActiveRecord::Migration[5.2]
  def change
    create_table :geolocations do |t|
      t.string  :ip, null: false
      t.string  :ip_type, null: false
      t.string  :country, null: false
      t.string  :city, null: false
      t.decimal :latitude, null: false
      t.decimal :longitude, null: false
      t.timestamps
      t.index   :ip, unique: true
    end
  end
end
