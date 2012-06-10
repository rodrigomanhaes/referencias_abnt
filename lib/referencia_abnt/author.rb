require 'unicode'

class Author
  def initialize(options)
    @author, @organization = options[:author], options[:organization]
  end

  def to_s
    make_author || make_organization
  end

  private

  def make_author
    @author.
      split(' ').
      map {|nome| Unicode.upcase(nome) }.
      rotate(-1).
      map.with_index {|n, i| i == 0 ? "#{n}," : "#{n[0]}." }.
      join(' ') if @author
  end

  def make_organization
    Unicode.upcase(@organization) + '.' if @organization
  end
end
