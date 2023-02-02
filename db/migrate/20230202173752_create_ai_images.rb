class CreateAiImages < ActiveRecord::Migration[7.0]
  def change
    create_table :ai_images do |t|
      t.text :prompt
      t.string :img_url
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
