class Patient

  @@all = []

  attr_accessor :name, :appointment, :doctor

  def initialize(name)
    @name=name
    @@all << self
  end

  def self.all
    @@all
  end

  def new_appointment(doctor, date)
  Appointment.new(date, self, doctor)
  end

  def appointments
    Appointment.all.select do |x|
      x.patient == self
    end
  end

  def doctors
    self.appointments.map do |x|
      x.doctor
    end.uniq
  end
end
