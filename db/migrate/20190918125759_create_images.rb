class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.belongs_to :user, foreign_key: true, null: false

      t.timestamps
    end
  end
end
