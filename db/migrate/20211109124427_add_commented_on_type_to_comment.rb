class AddCommentedOnTypeToComment < ActiveRecord::Migration[5.0]
  def change
    add_column :comments, :commented_on_type, :string
    add_column :comments, :commented_on_id, :integer
  end
end
