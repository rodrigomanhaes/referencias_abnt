class ABNTReference
  def initialize(options)
    @author = Author.new(options.slice(:author, :organization, :editor).
      merge(collection_provided: Collection.provided?(options)))
    @title = Title.new(options.slice(:title, :subtitle).merge(author: @author))
        @collection = Collection.new(options.slice(
      :booktitle, :booksubtitle, :editor, :editortype))
    @collection = Collection.new(options.slice(
      :booktitle, :booksubtitle, :editor, :editortype).
      merge(work_author: @author))
    @edition = Edition.new(options.slice(:edition))
    @publication_info = PublicationInfo.new(
      options.slice(:address, :publisher, :year, :month, :type, :furtherresp))
    @complement = Complement.new(options.slice(
      :pages, :note, :url, :dimensions, :series, :number, :isbn, :volume,
      :school, :type, :address, :illustrated, :chapter, :urlaccessdate, :issn))
  end

  def to_s
    "%s%s%s%s%s%s" % [@author, @title, @collection, @edition, @publication_info, @complement]
  end
end
