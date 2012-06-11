class Title
  def initialize(title, subtitle = nil)
    @title, @subtitle = title, subtitle
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
