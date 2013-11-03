class CreateCollages < ActiveRecord::Migration
  def change
    create_table :collages do |t|
      t.string :title
      t.string :image
      t.string :photos
      t.integer :user_id

      t.timestamps
    end
  end
end
