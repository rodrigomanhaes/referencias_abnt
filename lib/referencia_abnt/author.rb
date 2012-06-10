require 'unicode'

class Author
  def initialize(name)
    @name = name
  end

  def to_s
    @name.
      split(' ').
      map {|nome| Unicode.upcase(nome) }.
      rotate(-1).
      map.with_index {|n, i| i == 0 ? "#{n}," : "#{n[0]}." }.
      join(' ')
  end
end
