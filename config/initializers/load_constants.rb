set_constants = YAML.load_file(File.join("#{Rails.root}", "config/constants.yml")).with_indifferent_access[Rails.env]

set_constants.each do |key, value|
  ENV[key] = value
end