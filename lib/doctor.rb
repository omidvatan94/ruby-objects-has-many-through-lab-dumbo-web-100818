class Doctor

  @@all = []

  attr_accessor :name

  def initialize(name)
    @name=name
    @@all << self
  end

  def self.all
    @@all
  end

  def appointments
    Appointment.all.select do |x|
      x.doctor == self
    end
  end

  def new_appointment(patient, date)
    Appointment.new(date, patient, self)
  end

  def patients
    patients = []
    self.appointments.each do |x|
    patients << x.patient
    end
    patients
  end
end
