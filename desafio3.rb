class Appointment
    attr_accessor :location, :purpose, :hour, :min
    def initialize (location, purpose, hour, min)
        @location=location
        @purpose=purpose
        @hour=hour
        @min=min
    end

end


class MonthlyAppointment<Appointment
    attr_accessor :day
    def initialize (location, purpose, hour, min, day)
        super(location, purpose, hour, min)
        @day=day
    end

    def occurs_on?(day)
        @day==day
    end

    def to_s()
        puts "Reunión mensual en #{@location} sobre #{@purpose} el día #{@day} a las(s) #{@hour}:#{@min}"
    end
end

#puts MonthlyAppointment.new('NASA', 'Aliens', 8, 15, 23).to_s

class DailyAppointment<Appointment
    def to_s()
        puts "Reunión diaria en #{@location} sobre #{@purpose} a las(s) #{@hour}:#{@min}"
    end
    def occurs_on?(hour,min)
        @hour==hour && @min==min
    end
end

#puts DailyAppointment.new('Desafío Latam', 'Educación', 8, 15).to_s
puts DailyAppointment.new('Desafío Latam', 'Educación', 8, 15).occurs_on?(8,15)

class OneTimeAppointment<Appointment
    attr_accessor :day, :month, :year

    def initialize (location, purpose, hour, min, day, month, year)
        super(location, purpose, hour, min)
        @day=day
        @month=month
        @year=year
    end
    def occurs_on?(day, month, year)
        @day==day && @month==month && @year==year
    end
    def to_s()
        puts "Reunión única en #{@location} sobre #{@purpose} el #{@day}/#{@month}/#{@year} a las(s) #{@hour}:#{@min}"
    end

end
puts OneTimeAppointment.new('Desafío Latam', 'Trabajo', 14, 30, 4, 6, 2019).to_s
# Reunión única en Desafío Latam sobre Trabajo el 4/6/2019 a la(s) 14:30.
