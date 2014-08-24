class CreateExtractions < ActiveRecord::Migration
  def change
    create_table :extractions do |t|
      t.string :url

      t.timestamps
    end
  end
end
