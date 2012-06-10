require 'unicode'

class ABNTReference
  def initialize(options)
    @reference = "%s %s. %s: %s, %s." % [
      transform(options[:author]), options[:title], options[:address],
      options[:publisher], options[:year]]
  end

  def to_s
    @reference
  end

  private

  def transform(author_name)
    author_name.
      split(' ').
      map {|nome| Unicode.upcase(nome) }.
      rotate(-1).
      map.with_index {|n, i| i == 0 ? "#{n}," : "#{n[0]}." }.
      join(' ')
  end
end
