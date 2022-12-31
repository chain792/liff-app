class CreateButtons < ActiveRecord::Migration[6.0]
  def change
    create_table :buttons do |t|
      t.integer :number, null: false, default: 0
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
