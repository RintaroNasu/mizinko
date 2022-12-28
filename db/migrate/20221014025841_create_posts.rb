class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.text :body  
      t.datetime "discarded_at", precision: 6 #追加
      t.index ["discarded_at"], name: "index_posts_on_discarded_at" #追加
      t.date :time
      t.datetime :done_at


      t.timestamps
    end
  end
end
