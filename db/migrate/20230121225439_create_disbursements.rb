class CreateDisbursements < ActiveRecord::Migration[7.0]
  def change
    create_table :disbursements do |t|
      t.references :merchant, null: false, foreign_key: true
      t.decimal :amount, precision: 10, scale: 2
      t.date :week

      t.timestamps
    end
  end
end
