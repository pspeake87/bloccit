class CreateSummaries < ActiveRecord::Migration
  def change
    create_table :summaries do |t|
      t.boolean :public
      t.text :description, default: true

      t.timestamps null: false
    end
  end
end
