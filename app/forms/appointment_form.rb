class AppointmentForm < Reform::Form

  include DSL

  property :type
  property :when
  property :where
  property :apt_number
  property :hiding

  property :first_name
  property :last_name
  property :phone
  property :email
  property :password


end