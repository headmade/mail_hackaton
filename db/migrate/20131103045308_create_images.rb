class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :title
      t.string :image
      t.references :user

      t.timestamps
    end
  end
end
