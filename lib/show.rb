class CurtainCallSeattle::Show
    
    attr_accessor :name, :theater, :dates, :description
    
    @@all = []
    

    def initialize(show_hash)
        show_hash.each {|key, value| self.send(("#{key}="), value)}
        save
    end
    
    def self.create_shows_array(show_array)
      show_array.each {|show| CurtainCallSeattle::Show.new(show) if show != nil}
    end
    
    def theater=(theater)
       @theater = theater
       theater.add_show(self)
    end
    
    def save
      @@all << self 
    end
    
    def self.all
       @@all 
    end

   def self.get_shows_by_month(month)
      self.all.select {|i| i.dates.first.mon <= month && i.dates.last.mon >= month}
   end
   
   #returns true if the month is in the show date range
   def show_month_includes?(show, month)
       show.dates.first.mon <= month && show.dates.last.mon >= month
   end
   
   def self.get_shows_by_name
      self.all.map {|i| i.name} 
   end
    
end