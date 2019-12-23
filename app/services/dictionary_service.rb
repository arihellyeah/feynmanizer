require "jsonpath"

class DictionaryService

  def get_definition(word)
    response = HTTP.get("https://www.dictionaryapi.com/api/v3/references/collegiate/json/#{word}
      ?key=#{ENV["DICTIONARY_API_KEY"]}").to_s

    parsed_response = JSON.parse(response)
    parsed_response
  end

  def extract_shortdef(parsed)
    jsonpath = JsonPath.new('$..shortdef[0]')
    parsed = jsonpath.on(parsed)
    parsed[0]
  end

  def def_from_api(word)
    parsed = get_definition(word)
    parsed.length > 0 ? extract_shortdef(parsed) : "API is deprecated"
  end


end
