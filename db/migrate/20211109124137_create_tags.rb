class CreateTags < ActiveRecord::Migration[5.0]
  def change
    create_table :tags do |t|
      t.string :name
      t.references :user, foreign_key: true
      t.references :campaign_tab, foreign_key: true

      t.timestamps
    end
  end
end
