class Collection
  def self.provided?(options)
    !options[:booktitle].nil?
  end

  def initialize(options)
    @provided = self.class.provided?(options)
    @author = Author.new(author: options[:editor])
    @work_author = options[:work_author]
    @title = Title.new(title: options[:booktitle],
                       subtitle: options[:booksubtitle],
                       author: @work_author)
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
    elsif @work_author && @work_author.provided?
      # presumes author is the editor
      '______.'
    else
      ''
    end
  end

  DEFAULT_EDITOR_ACRONYM = 'Ed.'

  def render_editor_acronym
    ' (%s).' % (@editortype || DEFAULT_EDITOR_ACRONYM)
  end
end
