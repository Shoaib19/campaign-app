class CreateTodos < ActiveRecord::Migration[5.0]
  def change
    create_table :todos do |t|
      t.string :title
      t.references :user, foreign_key: true
      t.references :campaign_tab, foreign_key: true

      t.timestamps
    end
  end
end
