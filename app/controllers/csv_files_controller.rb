class CsvFilesController < ApplicationController

  def index

  end


  def new

  end

  def result

    require 'csv'
    file = params[:csv_file][:file]
    @result = []
    CSV.foreach(file.tempfile.path) do |row|
      @result << row
    end
  rescue => ex
    @result = nil
    @error = ex.message
  end

end