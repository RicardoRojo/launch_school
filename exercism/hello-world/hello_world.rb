class HelloWorld
  def self.hello(name = nil)
    return 'Hello, World!' if !name
    "Hello, #{name}!"
  end
end