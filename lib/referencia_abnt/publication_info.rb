class PublicationInfo
  def initialize(options)
    @address, @publisher, @year, @month, @type, @furtherresp = options.
      values_at(:address, :publisher, :year, :month, :type, :furtherresp)
  end

  def to_s
    result = ' %s%s%s, %s%s.' % [
      render_furtherresp, render_address, render_publisher, render_month, @year]
    result[0..2] = result[2] if result.strip.start_with?(',')
    result
  end

  private

  def render_furtherresp
    @furtherresp ? "#{@furtherresp}. " : ''
  end

  def render_address
    @type ? '' : @address || '[S.l.]'
  end

  def render_publisher
    @publisher ? ": #{@publisher}" : ''
  end

  def render_month
    @month ? "#{@month}. " : ''
  end
end
