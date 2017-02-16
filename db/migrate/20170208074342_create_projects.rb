class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.references :user, index: true
      t.string     :git_url
      t.string     :description
      t.string     :demo_url
      t.string     :author_name
      t.string     :name
      t.string     :caption
      t.string     :twitter_id
      t.boolean    :approved
      t.timestamps
    end
  end
end
