companies = Hash.new(Array.new)


companies["Bell Labs"] = {:lat => 32.12341, :long => 12.1214},
companies["Google"] = {:lat => 12.12, :long => 53.368},
companies["MasterCard"] = [{:lat => 42.12, :long => 12.12}], # Pune

companies["MasterCard"] << {:lat => 78.12, :long => 12.872} # St. Louis

pp companies["CoderMana"]

companies["CoderMana"] << {:lat => 12.112, :long => 46.12}

pp companies["MasterCard"] # ?
