class CreateFaceposts < ActiveRecord::Migration[5.1]
  def change
    create_table :faceposts do |t|
      t.text :content
      t.text :image
      #forein key for assosiation
      t.references :user, foreign_key: true
      #end
      t.timestamps
    end
  end
end
