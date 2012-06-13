class Collection
  def initialize(options)
    @provided = !options[:booktitle].nil?
    @author = Author.new(author: options[:editor])
    @title = Title.new(title: options[:booktitle],
                       subtitle: options[:booksubtitle])
    @editortype = options[:editortype]
  end

  def to_s
    @provided ? ' In: %s%s' % [render_author, @title] : ''
  end

  def provided?
    @provided
  end

  private

  def render_author
    if @author.provided?
      '%s%s' % [@author, render_editor_acronym]
    else
      # presumes author is the editor
      '______.'
    end
  end

  DEFAULT_EDITOR_ACRONYM = 'Ed.'

  def render_editor_acronym
    ' (%s).' % (@editortype || DEFAULT_EDITOR_ACRONYM)
  end
end
