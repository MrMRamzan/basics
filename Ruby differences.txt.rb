"Current Latest stable Version: V2.6.1"

map_test = {
 'a1' => {'w1' => 'k1', 'x1' => 'l1', 'y1' => 'm1', 'z1' => 'n1'},
 'a2' => {'w2' => 'k2', 'x2' => 'l2', 'y2' => 'm2', 'z2' => 'n2'},
 'a3' => {'w3' => 'k3', 'x3' => 'l3', 'y3' => 'm3', 'z3' => 'n3'}}

result = {}
p result = map_test.keys
4.times { |i| result += map_test.map { |n| p n.last.keys[i] } }
4.times { |i| result += map_test.map { |n| p n.last.values[i] } }
p result # => ["a1", "a2", "a3", "w1", "w2", "w3", "x1", "x2", "x3", "y1", "y2", "y3", "z1", "z2", "z3", "k1", "k1", "k1", "l1", "l2", "l3", "m1", "m2", "m3", "n1", "n2", "n3"]

a_proc = Proc.new {|a, *b| b.collect {|i| i*a }}
p a_proc.call(9, 1, 2, 3)   #=> [9, 18, 27]
p a_proc[9, 1, 2, 3]        #=> [9, 18, 27]


"Monkey Patching"
  class << self

"Ruby 5"
"append & prepend inplace of unshift/push"
b = [1,2,3]
b << 4 #=> [1,2,3,4]
b.push(5) #=> [1,2,3,4,5]
# NEW IN RUBY 2.5
# b.append(6) #=> [1,2,3,4,5,6]
# a.prepend(0) #=> [0,1,2,3,4, 5, 6]

"Random string"
p Random.new(1234) == Random.new(1234) # => true
p r = Random.new(1234) # => object
p r.rand()	# => fixed random value, won't change on recompile 0.1915194503788923
p r.rand()	# => fixed random value, won't change on recompile 0.6221087710398319
p rand() # => random value on each compile
p rand(0..9999) # => Or rand(9999)
# p Random.raw_seed(3)
"For alpha numeric random value"
p [*('a'..'z'),*('0'..'9'),*('A'..'Z')].sample(7).join
p rand(36**7).to_s(36)
# NEW IN RUBY 2.5
# require 'securerandom'
# alnum = SecureRandom.alphanumeric(7)

"Ruby 2.5 has introduced Kernel#yield_self method. It does nothing fancy: just, as the name suggests, yields object it is applied to and returns the result:"
# 1.yield_self { |i| i + 2 } # => 3
# p nil.yield_self { |obj| "Hello World" } # => "Hello World"
# p nil.try { |obj| "Hello World" } # => nil
# add_greeting = -> (str) { "HELLO " + str }
# "world".yield_self(&add_greeting)

"String#delete_prefix/delete_suffix can remove prefix and suffix from a string:"
p 'invisibled'.delete_prefix('in') #=> "visibled"
p 'invisibled'.delete_suffix('d') #=> "invisible"

"transform_keys"
hash = { a: 1, b: 2 }
hash.transform_keys { |k| (k.to_s*2).to_sym } # => { aa: 1, bb: 2 }


"TracePoint"
"
	We can use TracePoint to gather information specifically for exceptions.
	In Ruby 2.5 About 5-10% performance improvement by removing all trace instructions
	Improve performance of some built-in methods including
	Array#concat, Enumerable#sort_by, String#concat, String#index, Time#+, and more.
"

"Mutex"
" Mutex is rewritten to be smaller and faster. "


p '*******************************'
"Ruby 2.6.0"

"	Ruby 2.6 introduces an initial implementation of JIT (Just-in-time) compiler.
	How to use: Just specify --jit in command line
	As of Ruby 2.6.0 preview3, we achieved 1.7x faster performance than Ruby 2.5 on CPU-intensive

	Add a new alias 'then' to Kernel#yield_self
		File.read(filename).then(&JSON.method(:parse))
	An endless range, (1..), is introduced

	Ruby 2.6 introduces RubyVM::AST (Abstract Syntax Tree) module.
	Speedup Proc#call & block.call

	Transient Heap (theap) is introduced, which is managed heap for short-living memory objects (short lifetime)
	which are pointed by specific classes (Array, Hash, Object, and Struct).
		For example, making small and short-living Hash object is x2 faster 
"
