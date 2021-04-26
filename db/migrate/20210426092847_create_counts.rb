class CreateCounts < ActiveRecord::Migration[6.0]
  def change
    create_table :counts do |t|
      t.references :user,    null: false, foreign_key: true
      t.references :board,    null: false, foreign_key: true
      t.references :comment,    null: false, foreign_key: true
      t.timestamps
    end
  end
end
