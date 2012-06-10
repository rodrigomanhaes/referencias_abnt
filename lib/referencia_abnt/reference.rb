class ABNTReference
  def initialize(options)
    @author = Author.new(options.slice(:author, :organization))
    @title = Title.new(options[:title], options[:subtitle])
    @publication_info = PublicationInfo.new(
      options.slice(:address, :publisher, :year))
  end

  def to_s
    "%s %s. %s." % [@author, @title, @publication_info]
  end
end
