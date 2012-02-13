class SimulationUtilities
  #Simulates multiple random functions being called in contant time
  def self.calcMultipleRand(times, min_val, max_val)
    min = min_val * times
    max = max_val * times
    range = max - min

    if(times > 1)
      std_dev = 1
      val = normal_rand(range, std_dev)
    else
      val = rand(range)
    end
    
    val += min_val
    
    return val
  end
  
  #Returns a random number with a normal distribution
  #Rounds values to integers if max_value is an integer
  #Based on the Box-Muller transform
  # http://en.wikipedia.org/wiki/Box–Muller_transform
  def self.normal_rand(max_value = 1.0, std_dev = 0.25)
    half_range = max_value / 2.0
    
    u1 = rand
    u2 = rand
    rand_var = Math.sqrt(-2 * Math.log(u1)) * Math.cos(2 * Math::PI*u2)
    rand_var *= std_dev
    rand_var += half_range
    
    rand_var = 0 if rand_var < 0
    rand_var = max_value if rand_var > max_value
    rand_var = rand_var.round if max_value.integer?
    
    return rand_var
  end
  
  #Returns the C02 equivalent of the number of points
  def self.pointsToCo2InKg(points)
    co2InKg = points * 0.045359237
    co2InKg = co2InKg.floor
    return co2InKg;  
  end
  
  #Returns the Biomass equivalent of the number of points
  def self.pointsToBiomassInKg(points)
    co2InKg = points * 0.045359237
    co2InKg = co2InKg.floor
    bioMass = co2InKg * 0.25
    bioMass = bioMass.floor
    return bioMass;  
  end
end