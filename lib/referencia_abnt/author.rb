require 'unicode'

class Author
  def initialize(options = {})
    @author, @organization, @editor, @collection = options.values_at(
      :author, :organization, :editor, :collection)
  end

  def to_s
    make_editor || make_author || make_organization || ''
  end

  def provided?
    !!(@editor || @author || @organization)
  end

  private

  def make_editor
    "#{authorize(@editor)} (Ed.)." if @editor && !collection_provided?
  end

  def collection_provided?
    @collection && @collection.provided?
  end

  def make_author
    authorize(@author) if @author
  end

  def make_organization
    if @organization
      # apparently, when there are parentheses in the organization name,
      # the name, beyond the first parenthesis, isn't upcased.
      parts = @organization.split('(')
      name = Unicode.upcase(parts.shift)
      other_info = parts.join('(')
      other_info = '(' + other_info unless other_info.empty?
      "#{name}#{other_info}."
    end
  end

  def authorize(name)
    name.
      split(';').
      map(&:strip).
      map { |author|
        author.
          gsub(/ D(a|e|o|as|os) /i, ' ').gsub(/ E /i, ' ').
          split(' ').
          map {|nome| Unicode.upcase(nome) }.
          rotate(-1).
          map.with_index {|n, i| i == 0 ? "#{n}," : "#{n[0]}." }.
          join(' ')
      }.
      join('; ')
  end
end
