# encoding: utf-8

class Complement
  def initialize(options)
    @pages, @note, @url, @dimensions =
      options.values_at(:pages, :note, :url, :dimensions)
  end

  def to_s
    render_pages + render_dimensions + render_note + render_url
  end

  private

  def render_dimensions
    if @dimensions
      dimensions = " #{@dimensions}."
      @pages ? ",#{dimensions}" : dimensions
    else
      ''
    end
  end

  def render_pages
    @pages ? " #{@pages} p." : ''
  end

  def render_note
    @note ? " #{@note}." : ''
  end

  def render_url
    @url ? " Disponível em: <#{@url}>." : ''
  end
end
