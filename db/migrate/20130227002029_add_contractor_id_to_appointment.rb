class AddContractorIdToAppointment < ActiveRecord::Migration
  def change
    add_column :contractors, :title, :string
  end
end
