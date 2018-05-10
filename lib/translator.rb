require "yaml"

def load_library(path)
  file = YAML.load_file(path)
  new_file = {}
  get_meaning = {}
  get_emoticon = {}
  
  file.each do |emotion, values|
    get_meaning[values[1]] = emotion
    get_emoticon[values[0]] = values[1] 
  end
  new_file["get_meaning"] = get_meaning
  new_file["get_emoticon"] = get_emoticon
  new_file
end

def get_japanese_emoticon(path, emoticon)
  file = load_library(path)
  file["get_emoticon"].each do |key, value|
    if key == emoticon
      return value
    end
  end
  return "Sorry, that emoticon was not found"
end

def get_english_meaning(path, emoticon)
  file = load_library(path)
  file["get_meaning"].each do |key, value|
    if key == emoticon 
      return value
    end
  end
  return "Sorry, that emoticon was not found"
end