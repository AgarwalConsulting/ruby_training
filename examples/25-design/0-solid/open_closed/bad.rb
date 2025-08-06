def checkout(total, type)
  if type == :percentage
    total * 0.9
  else
    total
  end
end
