class ABNTReference
  def initialize(options)
    @reference = "%s %s. %s: %s, %s." % [
      Author.new(options[:author]), options[:title], options[:address],
      options[:publisher], options[:year]]
  end

  def to_s
    @reference
  end
end
