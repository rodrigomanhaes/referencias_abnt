class Edition
  def initialize(options = {})
    @edition = options[:edition]
  end

  def to_s
    @edition ? " #{@edition}. ed." : ''
  end
end
