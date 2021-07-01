class CreateAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :accounts do |t|
      t.string :title
      t.string :api_key
      t.string :secret_key
      t.string :exchange_market

      t.timestamps
    end
  end
end
