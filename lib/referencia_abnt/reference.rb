class ABNTReference
  def initialize(options)
    @collection = Collection.new(options.slice(
      :booktitle, :booksubtitle, :editor, :editortype))
    @author = Author.new(options.slice(:author, :organization, :editor).
      merge(collection: @collection))
    @title = Title.new(options.slice(:title, :subtitle).merge(author: @author))
    @edition = Edition.new(options.slice(:edition))
    @publication_info = PublicationInfo.new(
      options.slice(:address, :publisher, :year, :month, :type, :furtherresp))
    @complement = Complement.new(options.slice(
      :pages, :note, :url, :dimensions, :series, :number, :isbn,
      :school, :type, :address, :illustrated, :chapter))
  end

  def to_s
    "%s%s%s%s%s%s" % [@author, @title, @collection, @edition, @publication_info, @complement]
  end
end
