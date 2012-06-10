class PublicationInfo
  def initialize(options)
    @address, @publisher, @year = options.values_at(:address, :publisher, :year)
  end

  def to_s
    '%s: %s, %s' % [@address, @publisher, @year]
  end
end
