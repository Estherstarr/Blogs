class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.column :text, :text

      t.timestamps
    end
    
    add_reference :comments, :author, foreign_key: { to_table: :users }, index: true
    add_reference :comments, :post, foreign_key: true, index: true


  end
end
