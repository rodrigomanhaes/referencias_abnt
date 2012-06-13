# encoding: utf-8

class Complement
  def initialize(options)
    @pages, @note, @url, @dimensions, @series, @number, @isbn, @type,
      @school, @address, @illustrated, @chapter =
      options.values_at(:pages, :note, :url, :dimensions, :series, :number,
        :isbn, :type, :school, :address, :illustrated, :chapter)
  end

  def to_s
    render_chapter << render_pages << render_illustrated << \
      render_dimensions << render_thesis << render_series << render_note << \
      render_isbn << render_url
  end

  private

  def render_chapter
    @chapter ? ' cap. %s' % @chapter : ''
  end

  def render_pages
    if @pages
      if pages_is_a_range?
        "#{pages_connector}#{page_acronym}. #{@pages}."
      else
        "#{pages_connector}#{@pages} #{page_acronym}."
      end
    else
      ''
    end
  end

  def pages_connector
    @chapter ? ', ' : ' '
  end

  def pages_is_a_range?
    @pages =~ /^[0-9]+\-[0-9]+$/
  end

  def page_acronym
    @type ? 'f' : 'p'
  end

  def render_dimensions
    if @dimensions
      dimensions = " #{@dimensions}."
      (@pages || @illustrated) ? ",#{dimensions}" : dimensions
    else
      ''
    end
  end

  def render_illustrated
    if @illustrated
      illustrated = ' il.'
      @pages ? ",#{illustrated}" : illustrated
    else
      ''
    end
  end

  def render_thesis
    @type ? " Tese (#{@type})#{render_school}#{render_address}." : ''
  end

  def render_school
    @school ? " - #{@school}" : ''
  end

  def render_address
    @address ? ", #{@address}" : ''
  end

  def render_series
    @series ? " (#{@series}#{render_series_number})." : ''
  end

  def render_series_number
    @number ? ", #{@number}" : ''
  end

  def render_note
    @note ? " #{@note}." : ''
  end

  def render_isbn
    @isbn ? " ISBN #{@isbn}." : ''
  end

  def render_url
    @url ? " Disponível em: <#{@url}>." : ''
  end
end
