class CreateRecipies < ActiveRecord::Migration
  def change
    create_table :recipies do |t|
      t.string :title
      t.string :description
      t.attachment :photo

      t.timestamps null: false
    end
  end
end
