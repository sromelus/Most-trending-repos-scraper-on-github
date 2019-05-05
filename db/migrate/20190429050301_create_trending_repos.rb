class CreateTrendingRepos < ActiveRecord::Migration[5.2]
  def change
    create_table :trending_repos do |t|
      t.string :name, null: false
      t.string :description, null: false
      t.string :language
      t.string :contributors, array: true 

      t.timestamps
    end
  end
end
