class PublicationInfo
  def initialize(options)
    @address, @publisher, @year, @month =
      options.values_at(:address, :publisher, :year, :month)
  end

  def to_s
    '%s: %s, %s%s' % [@address, @publisher, render_month, @year]
  end

  private

  def render_month
    @month ? "#{@month}. " : ''
  end
end
