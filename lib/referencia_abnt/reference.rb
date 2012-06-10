class ABNTReference
  def initialize(options)
    @reference = "%s %s. %s: %s, %s." % [
      Author.new(options[:author]),
      make_title(options[:title], options[:subtitle]),
      options[:address],
      options[:publisher],
      options[:year]]
  end

  def to_s
    @reference
  end

  private

  def make_title(title, subtitle)
    title + make_subtitle(subtitle)
  end

  def make_subtitle(subtitle)
    subtitle ? ": #{subtitle.downcase.capitalize}" : ''
  end
end
