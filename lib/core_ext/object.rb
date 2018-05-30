class Object
  # http://api.rubyonrails.org/v4.2/classes/Object.html#method-i-blank-3F
  def blank?
    respond_to?(:empty?) ? !!empty? : !self
  end
end
