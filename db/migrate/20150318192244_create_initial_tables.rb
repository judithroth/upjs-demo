class CreateInitialTables < ActiveRecord::Migration
  def change
    
    create_table :sessions do |t|
      t.string :code
      t.timestamps
    end
    
    add_index :sessions, :code, unique: true
    
    create_table :cards do |t|
      t.integer :session_id
      t.string :title
      t.text :body
      t.integer :pattern_id
      t.timestamps
    end
    
    add_index :cards, :session_id
    
    create_table :patterns do |t|
      t.integer :session_id
      t.string :title
      t.text :css
      t.timestamps
    end

    add_index :patterns, :session_id

  end
end
