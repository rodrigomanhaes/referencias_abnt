class Title
  def initialize(options)
    @title, @subtitle = options.values_at(:title, :subtitle)
  end

  def to_s
    "#{make_title}#{make_subtitle}."
  end

  private

  def make_title
    " #{@title}"
  end

  def make_subtitle
    @subtitle ? ": #{@subtitle}" : ''
  end
end
