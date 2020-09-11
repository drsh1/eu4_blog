class CreateArticles < ActiveRecord::Migration[5.2]
  
  def change  # change to database adding table ARTICLES
    create_table :articles do |t|
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
