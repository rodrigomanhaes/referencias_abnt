class Edition
  def initialize(options = {})
    @edition = options[:edition]
  end

  def to_s
    if @edition
      if is_number?
        " #{@edition}. ed."
      else
        " #{@edition}."
      end
    else
      ''
    end
  end

  private

  def is_number?
    return false unless @edition
    begin
      Integer(@edition)
      true
    rescue
      false
    end
  end
end
