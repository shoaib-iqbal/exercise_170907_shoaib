class CreateGroupEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :group_events do |t|
    	t.datetime :start
    	t.datetime :end
    	t.string :duration
    	t.string :name
    	t.text :description
    	t.boolean :published, default: false
    	t.boolean :is_deleted, default: false
      t.timestamps
    end
  end
end
