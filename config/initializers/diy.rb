DateTime::DATE_FORMATS[:default]="%Y-%m-%d %H:%M:%S"

Time::DATE_FORMATS[:default] = "%Y-%m-%d %H:%M:%S"

Date::DATE_FORMATS[:default] = "%Y-%m-%d"

class String
  def block len=80,str = '...'
    if self.length > len
      return self[0,len] + str
    end
    self
  end
end
