ActiveAdmin.register Mailinglist do
  index do
    column :email
    column :user_type
    column :notes
    column :submitted_from_mobile
    default_actions
  end

  #filter :email
  #
  #form do |f|
  #  f.inputs "Admin Details" do
  #    f.input :email
  #    f.input :password
  #    f.input :password_confirmation
  #  end
  #  f.actions
  #end
end
