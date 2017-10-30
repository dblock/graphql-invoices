class CreateInvoices < ActiveRecord::Migration[5.1]
  def change
    create_table :invoices do |t|
      t.integer :fee_in_cents

      t.timestamps
    end
  end
end
