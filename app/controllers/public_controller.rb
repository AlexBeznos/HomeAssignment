class PublicController < ApplicationController
  def index
    uploaded_io = params[:file]
    File.open(Rails.root.join('public', 'uploads', uploaded_io), 'wb') do |file|
      file.write(uploaded_io.read)
    end
  end

end
