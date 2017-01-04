class CreatePostsTable < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :author_id
      t.string :content
    end
  end
end
