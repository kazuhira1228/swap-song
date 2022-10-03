class CreateGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :groups do |t|
      t.string     :group_name,  null: false
      t.string     :first_user,  null: false
      t.string     :second_user, null: false
      t.string     :third_user,  null: false
      t.string     :fourth_user, null: false
      t.string     :fifth_user,  null: false
      t.string     :sixth_user
      t.date       :group_since, null: false
      t.text       :text,        null: false
      t.references :user,        foreign_key: true
      t.timestamps
    end
  end
end
