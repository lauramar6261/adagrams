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

def uses_available_letters? (input, letters_in_hand)
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
