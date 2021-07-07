require 'yaml'

def load_library (library_name)
  reorganized = {:get_meaning => {}, :get_emoticon => {}}
  
  base_data = YAML.load_file(library_name)
  base_data.collect do |index| 
    meaning = index[0]
    english = index[1][0]
    japanese = index[1][1]
    reorganized[:get_meaning][japanese] = meaning
    reorganized[:get_emoticon][english] = japanese
  end
  
  reorganized
end

def get_japanese_emoticon (library_name, emoticon)
  find_key(library_name, :get_emoticon, emoticon)
end

def get_english_meaning (library_name, emoticon)
  find_key(library_name, :get_meaning, emoticon)
end



def find_key (library_name, key, emoticon)
  translator = load_library(library_name)

  translator[key].collect do |i|
    if i[0] == emoticon
      return i[1]
    end
  end
  pp "Sorry, that emoticon was not found"
end
