class CsvFilesController < ApplicationController

  def index

  end


  def new

  end

  def result

    require 'csv'
    file = params[:csv_file][:file]
    @result = []
    encodings = ['utf-8', "ISO8859-1"]
    index = 0
    begin
      CSV.foreach(file.tempfile.path, encoding: encodings[index]) do |row|
        @result << row
      end
    rescue Exception => ex
      index += 1
      @result = []
      retry if index < encodings.length
      @error = ex.message
    end
  end

end
