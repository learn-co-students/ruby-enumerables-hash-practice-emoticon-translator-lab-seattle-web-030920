require 'yaml'
require 'pry'

def load_library(fp)
  emoticons = YAML.load_file(fp)
  
  hash = {
    "get_meaning" => {},
    "get_emoticon"=> {}
  }
  emoticons.each do |key, value|
      hash["get_emoticon"][value[0]] = emoticons[key][1]
      hash["get_meaning"][value[1]] = key
    end
  return hash
end

def get_japanese_emoticon(fp, emoticon)
    loaded = load_library(fp)
    solution =  loaded["get_emoticon"][emoticon]
    if solution 
      solution
    else 
      "Sorry, that emoticon was not found"
    end
end

def get_english_meaning(fp, emoticon)
  loaded = load_library(fp)
    solution =  loaded["get_meaning"][emoticon]
    if solution 
      solution
    else 
      "Sorry, that emoticon was not found"
    end
end