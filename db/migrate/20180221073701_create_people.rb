class CreatePeople < ActiveRecord::Migration[5.1]
  def change
    create_table :people do |t|
      t.string :name
      t.string :birthday
      t.string :photoUrl
      t.string :profileUrl
      t.string :title
      t.string :url
      t.float :rating
      t.string :director
      t.timestamps
    end
  end
end
