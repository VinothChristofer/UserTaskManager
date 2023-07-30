class CreateWeatherInfo < ActiveRecord::Migration[7.0]
  def change
    create_table :weather_info do |t|
      t.belongs_to :task, null: false #automatically indexing on this column is done
      t.decimal :temperator
      t.decimal :rain
      t.decimal :humidity
      t.decimal :windspeed
      t.string :description
      t.timestamps
    end
  end
end
