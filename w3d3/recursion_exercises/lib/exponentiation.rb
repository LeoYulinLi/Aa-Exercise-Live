def exp(base, power)
  return 1 if power == 0

  base * exp(base, power - 1)
end

def exp2(base, power)
  return 1 if power == 0
  return base if power == 1
  if power.even?
    temp = exp2(base, power / 2)
    temp * temp
  else
    temp = exp2(base, (power - 1) / 2)
    base * temp * temp
  end
end

p exp2(2, 10)
