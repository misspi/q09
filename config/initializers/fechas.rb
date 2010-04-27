
class Date

  def self.from_db(encoded)
    Date.civil(encoded[0..3].to_i, encoded[4..5].to_i, encoded[6..7].to_i)
  end

  def self.from_nor43(encoded)
    year = encoded[0..1].to_i
    year = year + (year > 80 ? 1900 : 2000)
    Date.civil(year, encoded[2..3].to_i, encoded[4..5].to_i)
  end

  def fecha
    self.strftime("%d/%m/%Y")
  end

  def to_db
    self.strftime("%Y%m%d")
  end
end

class Time
  def fecha
    self.strftime("%d/%m/%Y")
  end
end