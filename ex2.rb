def get_index(str, arr_words)
    return [] if str.empty? || arr_words.empty? || arr_words[0].empty?
    
    word_length = arr_words[0].length
    return [] unless arr_words.all? { |word| word.length == word_length }

    word_count = arr_words.length
    substring_length = word_length * word_count
    
    word_frequency = Hash.new(0)
    arr_words.each { |word| word_frequency[word] += 1 }

    result = []
    (0..str.length - substring_length).each do |i|
      seen_words = Hash.new(0)
      j = 0
      while j < word_count
        word = str[i + j * word_length, word_length]
        break unless word_frequency.key?(word)
        seen_words[word] += 1
        break if seen_words[word] > word_frequency[word]
        j += 1
      end
      result << i if j == word_count
    end
    result.empty? ? "not found" : result.inspect
  end
  
  str = "mainamthenammaibun"
  arr_words = ["nam", "mai"]
  puts get_index(str, arr_words)
  
  str = "thinhnghianghianghiatuyenthinh"
  arr_words = ["thinh", "nghia", "tuyen", "thinh"]
  puts get_index(str, arr_words) 
  
  str = "mainamnammaichinammaibun"
  arr_words = ["mai", "nam", "chi"]
  puts get_index(str, arr_words) 
  