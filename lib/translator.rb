require 'yaml'

def load_library(file_path)
  result = YAML.load_file(file_path)
  emoticons = {get_meaning: {}, get_emoticon: {}}
  result.reduce({}) do |memo, (key, value)|
    emoticons[:get_meaning][value[1]] = key
    emoticons[:get_emoticon][value[0]] = value[1]
  end
  emoticons
end

def get_japanese_emoticon(file_path, eng_emoticon)
  emoticons = load_library(file_path)
  if emoticons[:get_emoticon][eng_emoticon]
    return emoticons[:get_emoticon][eng_emoticon]
  else
    return "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(file_path, jap_emoticon)
  emoticons = load_library(file_path)
  if emoticons[:get_meaning][jap_emoticon]
    emoticons[:get_meaning][jap_emoticon]
  else
    return "Sorry, that emoticon was not found"
  end
end
