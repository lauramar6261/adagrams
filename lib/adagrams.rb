# all letters
letters = %W(a a a a a a a a a b b c c d d d d e e e e e e e e e e e e f f g g g h h i i i i i i i i i j k l l l l m m n n n n n n o o o o o o o o p p q r r r r r r s s s s t t t t t t u u u u v v w w x y y z )

# range
max = letters.length
min = 0

# index used


# generate random index
index = Random.rand(min..max)
puts "#{letters[index]}"
