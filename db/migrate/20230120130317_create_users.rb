class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.column :name, :string
      t.column :photo, :string
      t.column :bio, :string
      t.column :posts_counter, :integer

      t.timestamps
    end
  end
end
