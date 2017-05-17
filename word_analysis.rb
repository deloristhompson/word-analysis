file_path = File.join(File.dirname(__FILE__), 'tale_of_two_cities.txt')
story_contents = File.read(file_path)

# what are the 3 most frequently used words?
downcased_contents = story_contents.downcase!
stripped_contents = downcased_contents.gsub(",", "").gsub(".", "").gsub("-", "")
words = stripped_contents.split(" ")
word_frequencies = {}

words.each do |word|
  if word_frequencies[word].nil?
    word_frequencies[word] = 0
  end
  word_frequencies[word] += 1
end

length_to_word_map = {}
word_frequencies.each do |word, count|
  if length_to_word_map[count].nil?
    length_to_word_map[count] = []
  end
  length_to_word_map[count] << word
end

word_count = 0
sort_frequencies = length_to_word_map.sort.reverse
sort_frequencies.each do |frequency|
  if word_count <= 2
    frequency[1].each do |word|
      puts word
      word_count += 1
    end
  end
end
puts

# how many times do all of the vowels appear?
characters = stripped_contents.split('')
character_count = {}
characters.each do |character|
  if character == 'a' || character == 'e' || character == 'i' ||
    character == 'o' || character == 'u'
    if character_count[character].nil?
      character_count[character] = 0
    end
    character_count[character] += 1
  end
end
character_count.each do |character, frequency|
  puts "There are #{frequency} #{character}'s'"
end
puts

# what is the most frequently used vowel?
max = -1
max_character = ''
character_count.each do |character, frequency|
  if frequency > max
    max = frequency
    max_character = character
  end
end

puts "#{max_character} is the most frequently used vowel"
puts

# what is the average vowel frequency?
average = 0

puts character_count.values
character_count.values.inject(0) do |sum, frequency|
  average = (sum += frequency)
end
puts "#{average / character_count.values.size.to_f} is the average frequency"
puts

# how many occurrences of specific punctuation marks are there?
punctuation = [
  "-",
  ".",
  ",",
]
punctuation_frequency = {}
downcased_contents.split('').each do |char|
  punctuation.each do |mark|
    if mark == char
      if punctuation_frequency[mark].nil?
        punctuation_frequency[mark] = 0
      end
      punctuation_frequency[mark] += 1
    end
  end
end
puts punctuation_frequency
