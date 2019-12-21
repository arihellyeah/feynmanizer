class DictionaryService

  def get_definition(word)
    response = HTTP.get("https://www.dictionaryapi.com/api/v3/references/collegiate/json/#{word}
      ?key=#{ENV["DICTIONARY_API_KEY"]}").to_s
    parsed_response = JSON.parse(response)
    parsed_response["def"]
  end
end
