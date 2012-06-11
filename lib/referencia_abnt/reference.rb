class ABNTReference
  def initialize(options)
    @author = Author.new(options.slice(:author, :organization))
    @title = Title.new(options.slice(:title, :subtitle).merge(author: @author))
    @edition = Edition.new(options.slice(:edition))
    @publication_info = PublicationInfo.new(
      options.slice(:address, :publisher, :year, :month, :type))
    @complement = Complement.new(options.slice(
      :pages, :note, :url, :dimensions, :series, :number, :isbn,
      :school, :type, :address))
  end

  def to_s
    "%s%s%s%s%s" % [@author, @title, @edition, @publication_info, @complement]
  end
end
