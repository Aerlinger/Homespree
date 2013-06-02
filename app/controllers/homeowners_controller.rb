class HomeownersController < ApplicationController
  layout "static_page", except: [:show, :edit]

  http_basic_authenticate_with name: "admin", password: "Meetmike9", only: :index


end
