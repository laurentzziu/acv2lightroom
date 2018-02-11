require_relative "errors/base"

%w(invalid_file_extension no_present_file no_file_provided).each do |file|
  require_relative "errors/validator/#{file}"
end

%w(curves_data_invalid no_filename_provided).each do |file|
  require_relative "errors/exporter/#{file}"
end
