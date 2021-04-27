class CreateJournals < ActiveRecord::Migration[6.1]
  def change
    create_table :journals do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title
      t.boolean :cash_inOut
      t.float :amount

      t.timestamps
    end
  end
end
