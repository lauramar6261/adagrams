require 'csv'

def draw_letters

  # all letters
  letters = %W(a a a a a a a a a b b c c d d d d e e e e e e e e e e e e f f g g g h h i i i i i i i i i j k l l l l m m n n n n n n o o o o o o o o p p q r r r r r r s s s s t t t t t t u u u u v v w w x y y z )
  # convert to upcase
  letters = letters.map do |letter|
    letter.upcase
  end
  # range
  max = letters.length - 1
  min = 0

  # index used
  indices_used= []

  # generate random index
  index = Random.rand(min..max)

  # get 10 unique indices, and saved them in indices used
  10.times do
    # check if index is in indices_used array , if true generate new random index
    while indices_used.include?(index)
      index = Random.rand(min..max)
    end
    # if not is not in indices used, add it there
    indices_used << index
  end

  ten_letters = indices_used.map do |index|
    letters[index]
  end

  return ten_letters
end

def uses_available_letters?(input, letters_in_hand)
  result = []
  final_results = []
  input.each_char do |letter|
    # check if letter exists in letters_in_han
    if letters_in_hand.include?(letter)
      result << true
    else
      # user used a letter that does not exists
      result << false
    end
  end
  final_results << result.all? { |value| value == true}

  input.each_char do |letter|
    # check if letter exists in letters_in_hand
    if letters_in_hand.include?(letter)
      letters_in_hand.delete(letter)
    else
      # user used a letter that does not exists
      final_results << false
    end
  end
  final_results.all? { |value| value == true}
end

def score_word(word)
  score = 0
  group1 = %w(A E I O U L N R S T)
  group2 = %w(D G)
  group3 = %w(B C M P)
  group4 = %w(F H V W Y)
  group5 = %w(J X)
  group6 = %w(Q Z)
  word.upcase.each_char do |letter|
    if group1.include?(letter)
      score += 1
    elsif group2.include?(letter)
      score += 2
    elsif group3.include?(letter)
      score += 3
    elsif group4.include?(letter)
      score += 4
    elsif group5.include?(letter)
      score += 8
    elsif group6.include?(letter)
      score += 10
    end
  end
  if word.length >= 7 && word.length <= 10
    score += 8
  end
  return score
end

def highest_score_from(words)
  # create hash of words and score
  data = {}
  winner = ""
  # create hash of words and scores
  # return key value pair, key = word, and value = score, add it to hash
  words.each do |word|
    data[word] = score_word(word)
  end

  # get max value in hash
  max = data.max_by {|k, v| v}[1]

  # select key - value pair/s
  # retutn array of words
  ties_words = data.select{ |k, v| v == max}

  if ties_words.length == 1 # only one word in ties_words array
    winner = ties_words[0]
  elsif ties_words.length > 1 # if there is more than one word
    shortest_length = 0
    # loop through every word that are in the ties array
    ties_words.each do |word|
      if word == 10
        winner = word
      else # identify the shortest word
        word.length > shortest_length
        shortest_length = word.length
        winner = word
      end
    end

  end
  winner
  score = data.select{ |k, v| k == winner}.values
  return {winner => score}
end


def is_in_english_dict?(input)  #input is a string
  CSV.open("assets/dictionary-english.csv", 'r') do |line|
    if line.to_s == (input)
      return true
    else
      return false
    end
  end
end
