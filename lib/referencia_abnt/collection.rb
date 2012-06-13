class Collection
  def initialize(options)
    @provided = options.slice(:editor, :booktitle, :booksubtitle).count == 3
    @author = Author.new(author: options[:editor])
    @title = Title.new(title: options[:booktitle],
                       subtitle: options[:booksubtitle])
    @editortype = options[:editortype]
  end

  def to_s
    @provided ? ' In: %s%s%s' % [@author, render_editor_acronym, @title] : ''
  end

  def provided?
    @provided
  end

  private

  DEFAULT_EDITOR_ACRONYM = 'Ed.'

  def render_editor_acronym
    ' (%s).' % (@editortype || DEFAULT_EDITOR_ACRONYM)
  end
end
