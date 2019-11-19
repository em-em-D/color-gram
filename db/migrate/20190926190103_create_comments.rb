# frozen_string_literal: true

# :nodoc:
class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.text :body
      t.references :post, foreign_key: true

      t.timestamps
    end
  end
end