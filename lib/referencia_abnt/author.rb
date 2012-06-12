require 'unicode'

class Author
  def initialize(options = {})
    @author, @organization, @editor = options.values_at(
      :author, :organization, :editor)
  end

  def to_s
    make_editor || make_author || make_organization || ''
  end

  def provided?
    !!(@editor || @author || @organization)
  end

  private

  def make_editor
    "#{authorize(@editor)} (Ed.)." if @editor
  end

  def make_author
    authorize(@author) if @author
  end

  def make_organization
    Unicode.upcase(@organization) + '.' if @organization
  end

  def authorize(name)
    name.
      gsub(/ D(a|e|o|as|os) /i, ' ').gsub(/ E /i, ' ').
      split(' ').
      map {|nome| Unicode.upcase(nome) }.
      rotate(-1).
      map.with_index {|n, i| i == 0 ? "#{n}," : "#{n[0]}." }.
      join(' ')
  end
end
