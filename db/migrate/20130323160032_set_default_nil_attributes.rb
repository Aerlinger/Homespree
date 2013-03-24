class SetDefaultNilAttributes < ActiveRecord::Migration
  def change
    change_column_default :contractors, :license,nil
    change_column_default :contractors, :email, nil
    change_column_default :contractors, :mobile_number, nil
    change_column_default :contractors, :office_number, nil
    change_column_default :contractors, :photo_filename, nil
  end
end
