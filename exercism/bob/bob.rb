require 'pry'
class Bob
  ACRONIMS = ['OK','DMW']

  def hey(remark)
    if say_fine_be_that_way?(remark)
      'Fine. Be that way!'
    elsif say_whatever?(remark)
      'Whatever.'
    elsif say_whoa_chill_out?(remark)
      'Whoa, chill out!'
    elsif say_sure?(remark)
      'Sure.'
    end
  end


  def say_whatever?(remark)
    stating_something?(remark) || talking_forcefully?(remark) || using_acronyms_in_regular_speech?(remark) || only_numbers?(remark) || 
      multiple_line_question?(remark)
  end

  def say_whoa_chill_out?(remark)
    shouting?(remark) || shouting_gibberish?(remark) || forceful_questions?(remark) || shouting_with_no_exclamation?(remark)
  end

  def say_sure?(remark)
    asking_question?(remark) 
  end

  def say_fine_be_that_way?(remark)
    silence?(remark) || prolongued_silence?(remark) || alternate_silences?(remark)
  end

  def stating_something?(remark)
    remark.chars.last == '.'
  end

  def shouting?(remark)
    remark.chars.last == '!'
  end

  def shouting_gibberish?(remark)
    giberish = true
    remark.chars.each do |char|
      if !("A".."Z").include?(char)
        giberish = false
      end
    end
    giberish
  end

  def shouting_with_no_exclamation?(remark)
    remark = remove_spaces(remark)
    shouting_gibberish?(remark)
  end

  def asking_question?(remark)
    remark.chars.last == '?'
  end

  def talking_forcefully?(remark)
    remark.start_with?("Let's")
  end

  def using_acronyms_in_regular_speech?(remark)
    ACRONIMS.each do |acronim|
      return true if remark.include?(acronim) && !remark.end_with?("?")
    end
    false
  end

  def forceful_questions?(remark)
    question = remark
    if question.end_with?("?")
      question = question.chop.gsub(' ','')
    end
    shouting_gibberish?(question)
  end

  def only_numbers?(remark)
    number = remove_spaces(remark)
    number = number.split(',')
    return true if number.map(&:to_i).map(&:to_s) == number
  end

  def remove_spaces(remark)
    remark.gsub(' ','')
  end

  def silence?(remark)
    remark.size == 0 
  end

  def prolongued_silence?(remark)
    silence?(remove_spaces(remark))
  end

  def alternate_silences?(remark)
    silence?(remark.gsub("\t",''))
  end

  def multiple_line_question?(remark)
    remark = remark.gsub("\n","")
    remark.start_with?("Does") && remark.include?("?") && !remark.end_with?("?")
  end
end