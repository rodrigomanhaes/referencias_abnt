require 'unicode'

class Title
  def initialize(options)
    @title, @subtitle, @author = options.values_at(:title, :subtitle, :author)
  end

  def to_s
    @title ? "#{render_title}#{render_subtitle}." : ''
  end

  private

  def render_title
    if @author && !@author.provided?
      render_title_as_author
    else
      render_title_as_usual
    end
  end

  def render_title_as_usual
    " #{@title}"
  end

  def render_title_as_author
    words = @title.split(' ')
    words[0] = Unicode.upcase(words[0])
    words.join(' ')
  end

  def render_subtitle
    @subtitle ? ": #{@subtitle}" : ''
  end
end
