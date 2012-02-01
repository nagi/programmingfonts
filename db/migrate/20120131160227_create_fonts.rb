class CreateFonts < ActiveRecord::Migration
  def change
    create_table :fonts do |t|
      t.string :name
      t.string :filename
      t.text :description
      t.string :link

      t.timestamps
    end
  end
end
