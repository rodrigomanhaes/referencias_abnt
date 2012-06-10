class ABNTReference
  def initialize(options)
    @reference = "%s %s. %s: %s, %s." % [
      Author.new(author: options[:author]),
      Title.new(options[:title], options[:subtitle]),
      options[:address],
      options[:publisher],
      options[:year]]
  end

  def to_s
    @reference
  end
end
