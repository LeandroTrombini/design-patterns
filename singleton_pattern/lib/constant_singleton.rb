ConstantSingleton = Struct.new(:name)

MY_SINGLETON = ConstantSingleton.new("John")

puts MY_SINGLETON.name