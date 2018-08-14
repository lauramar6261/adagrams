
# outputs a nill for one of the letters
# check for if index = Random.rand(min..max) includes max? it's returning nill at some point, check using lower range

# 1. write condition that checks if index is nill? if it give me another index


def draw_letters

  # all letters
  letters = %W(a a a a a a a a a b b c c d d d d e e e e e e e e e e e e f f g g g h h i i i i i i i i i j k l l l l m m n n n n n n o o o o o o o o p p q r r r r r r s s s s t t t t t t u u u u v v w w x y y z )

  # range
  max = letters.length
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

letters_in_hand = draw_letters

puts draw_letters
puts "Make a word from all ten of those letters!"
input = gets.chomp!

# it's not retuning true when the input is exactly as letters_in_hand
def uses_available_letters? (input, letters_in_hand)
  input.each_char do |letter|
    print letter
    # check if letter exists in letters_in_hand
    if letters_in_hand.include?(letter)
      # if it exits, delete
      letters_in_hand.delete(letter)
    else
      # user used a letter that does not exists
      return puts "false"
    end
  end
  # check if all letters in letters_in_hand were used
  if letters_in_hand.empty?
    return puts "true"
  else
    return puts "false"
  end
end

print uses_available_letters?(input, letters_in_hand)
