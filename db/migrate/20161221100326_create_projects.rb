class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.string :title
      t.text :front_end
      t.text :back_end
      t.text :description
      t.string :photo_url
      t.string :link

      t.timestamps
    end
  end
end
