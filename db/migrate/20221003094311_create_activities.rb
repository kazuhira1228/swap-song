class CreateActivities < ActiveRecord::Migration[6.0]
  def change
    create_table :activities do |t|
      t.string     :group,         null: false
      t.date       :activity_day,  null: false
      t.string     :song,          null: false
      t.string     :studio,        null: false
      t.text       :text,          null: false
      t.string     :image
      t.references :user,          foreign_key: true
      t.timestamps
    end
  end
end
