class ABNTReference
  def initialize(options)
    @reference = "%s %s. %s." % [
      Author.new(options.slice(:author, :organization)),
      Title.new(options[:title], options[:subtitle]),
      PublicationInfo.new(options.slice(:address, :publisher, :year))]
  end

  def to_s
    @reference
  end
end
