class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.column :title, :string
      t.column :text, :text
      t.column :comments_counter, :integer
      t.column :likes_counter, :integer

      t.timestamps
    end

    add_reference :posts, :author, foreign_key: { to_table: :users }, index: true

  end
end
