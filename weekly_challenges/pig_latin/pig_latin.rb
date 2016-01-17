# class piglatin
class PigLatin
  attr_accessor :phrase

  def self.translate(phrase)
    words = phrase.split(' ')
    words.map do |word|
      word = translate_word(word) unless start_with_vowel?(word)
      word << 'ay'
    end.join(' ')
  end

  def self.start_with_vowel?(word)
    !word.scan(/\A[aeiou]|[yx][^aeiou]/).empty?
  end

  def self.translate_word(word)
    words = word.match(/([^aeiou]?qu|[^aeiou]+)([a-z]+)/)
    words[2] << words[1]
  end
end
