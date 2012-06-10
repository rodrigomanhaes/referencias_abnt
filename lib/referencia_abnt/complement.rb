class Complement
  def initialize(options)
    @pages, @note = options.values_at(:pages, :note)
  end

  def to_s
    render_pages + render_note
  end

  private

  def render_pages
    @pages ? " #{@pages}p." : ''
  end

  def render_note
    @note ? " #{@note}." : ''
  end
end
