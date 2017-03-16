class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.string :title
      t.string :content
      t.date :date
      t.boolean :completed
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
