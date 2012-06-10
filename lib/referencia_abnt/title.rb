class Title
  def initialize(title, subtitle = nil)
    @title, @subtitle = title, subtitle
  end

  def to_s
    @title + make_subtitle
  end

  private

  def make_subtitle
    @subtitle ? ": #{@subtitle}" : ''
  end
end
