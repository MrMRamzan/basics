# => ruby HEREDOC syntax for multiple line string
<<HEREDOC
  Instance methods can access instance variables and instance methods directly.
  Instance methods can access class variables and class methods directly.
  Class methods can access class variables and class methods directly.
  Class methods cannot access instance variables or instance methods directly—they must use an object reference.
  Also, class methods cannot use the this keyword as there is no instance for this to refer to.
  a static variable is a variable that has been allocated "statically",
  meaning that its lifetime (or "extent") is the entire run of the program.
  A static method can access non-static methods and fields of any instance it knows of.
    However, it cannot access anything non-static if it does not know which instance to operate on.
  The only way to call a non-static method from a static method is to have an instance of the class containing the non-static method
  A static method can access only static data.
  non-static methods CAN modify static variables
  ***********************************************************\n
  :Public methods can be called by anyone.
  :Protected methods are only accessible within their defining class and its subclasses.
  :Private methods can only be accessed and viewed within their defining class.
HEREDOC

<<module_vs_class
  Classes are about objects.
  Modules are about functions/methods.
  Modules are about providing methods that you can use across multiple classes.
module_vs_class
"********************** Module **************************"
module Library
  puts "Self inside Library is: #{self}"
  # => Self inside Library is: Library

  class Author
    puts "Self inside Library::Author is: #{self}"
    # => Self inside Library::Author is: Library::Author
    # => it recognizes that there’s a hierarchy here, so we get the module plus the class
  end
end
"********************** Multiple Inheritance or Mixin **************************"
<<Mixin
  A Mixin is a class that contains methods for use by other 'Classes' without having to be the parent class of
those other classes.
  Module: like in helper
  'include' mixin in specified module methods as 'instance methods' in the target class
  'extend' mixes in specified module methods as 'class methods' in the target class
Mixin
module MyHelper1
  def time_format(time, format=nil)
    p time
  end
end
module MyHelper2
  def time_format2(time, format=nil)
    p time
  end
end

class MyClass
  include MyHelper1
  extend MyHelper2
end

# MyClass.time_format '12:52:00' # => error:method doesn't exist
MyClass.new.time_format '12:52:00' # => will run
MyClass.time_format2 '12:52:00' # will run
# MyClass.new.time_format2 '12:52:00' # => error: undefined method
"********************** Class **************************"
class User
  def first_name
    p "User's first name"
  end
  def self.last_name
    p "User's last name"
  end

  def self.is_this_public_method?
    false
  end

  def self_test
    self
  end
  def self.self_test2
    self
  end

  def hey(*args)
    p "Hello " + args.join(' ')
  end

  class << self
    # => define all self type methods
    def dob
      p "User's dob"
    end
  end

  private
    def cred_info
      p '**** **** **** 4242'
    end
    def self.cvc
      p '123'
    end
    private_class_method :is_this_public_method?
    # => to make pubilc method private, a method must be self type
end

User.new.first_name
User.last_name
# => Self  ==>  every piece of code you write "belongs" to some object
User.dob
p 1.send(:+, 1) # => 2
User.new.send :cred_info  # => accessing private method
User.send :cvc
#User.is_this_public_method # => errorL private method called for User:Class
p User.send :is_this_public_method?
User.new.hey 'yo', 'jon' 'doe', 'ye'
u = User.new
p u.self_test
p User.self_test2

p "********************** super() **************************"
<<super
  A call to super invokes the parent method with the same arguments that were passed to the child method. A call
  to super() invokes the parent method without any arguments, as presumably expected.
super

p "********************** String vs Symbols **************************"
<<diff
  Symbols are immutable.
  Mutable objects can be changed after assignment while immutable objects can only be overwritten.
  Symbols are instantiated faster than strings and some operations like comparing two symbols is also faster.
diff

my_symbol = '0'.to_sym
p my_symbol.object_id
p my_symbol.object_id
my_symbol = '2'.to_sym
p my_symbol.object_id
p my_symbol.object_id
my_symbol = '0'.to_sym
p my_symbol.object_id
p my_symbol.object_id

require 'benchmark' # => use to measure speed of code execution inside it's block
str = Benchmark.measure do
  10_000_000.times do
    "test"
  end
end.total
puts "String: " + str.to_s

sym = Benchmark.measure do
  10_000_000.times do
    :test
  end
end.total
puts "Symbol: " + sym.to_s

p "********************** Hash vs HashWithIndifferentAccess **************************"
<<IndifferentAccess
  HashWithIndifferentAccess allows us to access hash key as a symbol or string
IndifferentAccess
my_hash = {a: 1, b:2}
p my_hash[:a] # => 1
p my_hash['a'] # => nil
require 'active_support/core_ext/hash/indifferent_access'
my_hash = ActiveSupport::HashWithIndifferentAccess.new(a: 1, b:2)
    "OR"
my_hash = {a: 1, b:2}.with_indifferent_access
p my_hash[:a] # => 1
p my_hash['a'] # => 1
p "********************** Lambda vs Proc **************************"
<<block
  Block is everthing between curly braces {} or do end
  Proc.new just create a block of code that is part of the calling function.
block

[1,2,3].each { |x| puts x*2 }
[1,2,3].each do |x|
  puts x*2
end

<<nameless
  nameless function or lambda
  often used in defining scope
  -> this operator is often called the “stabby proc”.
nameless
-> (s) {p s} ["I’m a Proc"] # => “I’m a Proc”

lam = lambda { puts "Hello World" }
lam.call
pro = Proc.new { puts "Hello World" }
pro.call

lam = lambda { |x| p (x*2) if x } # => it takes 1 params
[1,2,3].each(&lam)
pro = Proc.new { |x| p (x*2) if x } # => it takes 1 params
[1,2,3].each(&pro) # The '&' tells ruby to turn the proc into a block

<<diff1
  if a proc takes params and no param is passed it will return nil
  while a lambda will give error
diff1
lam.call(11) # => 22
pro.call(11) # => 22
# lam.call # => error: wrong num of arg
p pro.call # => returns nil
# lam.call(11,22) # => error: wrong num of arg
pro.call(11,22) # => ignores extra params

<<diff2
  A return in a Proc returns from its enclosing block/method,
  while a return in a lambda simply returns from the lambda.
diff2
def lambda_test
  lam = lambda { return }
  lam.call
  puts "Hello world"
end
def proc_test
  proc = Proc.new { return }
  proc.call
  puts "Hello world"
end
lambda_test # => 'Hello World
proc_test # => 
p "********************** Monkey-Patching / Duck-Punching **************************"
<<desc
  Re-open any class and change it’s methods.
  use full when you want to overide an existing method i.e.
desc
class User
  def self.send arg=nil
    p "I won't let you access private methods"
  end
  def send arg=nil
    p "I won't let you access private methods"
  end

  private
  def credit_info
    p '**** **** **** 4242'
  end
end
User.new.send :credit_info
User.send :credit_info
p "********************** Map vs Collect vs Select vs Pluck **************************"
<<diff
  map is an alias for collect
  ary.collect {|item| block } → new_ary
  ary.map {|item| block } → new_ary
  select and pluck make SQL SELECT of specified columns i.e. (SELECT  "users"."name" FROM "users")
  'select' returns the list of models with the column specified
  'pluck' returns the list of values of the column specified

  Write a function that sorts the keys in a hash by the length of the key as a string.
  For instance, the hash:
  { abc: 'hello', 'another_key' => 123, 4567 => 'third' }
  should result in: ["abc", "4567", "another_key"]
diff

p my_hash = { abc: 'hello', 'another_key' => 123, 4567 => 'third' }
p my_hash.keys.map(&:to_s).sort_by(&:length)

a = [ "a", "b", "c", "d" ]
p a.collect {|x| x + "!" }
p a.map {|x| x + "!" }
p a.each {|x| x + "!" }

p "********************** Comparisoin **************************"
<<comparisoin
  == Checks if the value of two operands are equal
  === Specifically used to test equality within the when clause of a case statement
  eql? – Checks if the value and type of two operands are the same
  equal? – Compares the identity of two objects;
comparisoin
p "********************** Inject/Reduce **************************"
<<calc
  Fibonacci sequence of any length as an array.
calc
n = 20
p result = (1..n).inject( [0, 1] ) { | fib | fib << fib.last(2).inject(:+) }
p result = (1..n).reduce( [0, 1] ) { | fib | fib << fib.last(2).reduce(:+) }
p result.inject(:+)
p [].inject(:+) # => nil
p [].inject(0, :+)  # => 0
p result.reduce(:+)
p result + [-1, -2]

p [nil,123,nil,"test"].compact #remove nil, Returns a copy of self with all nil elements removed.
# result.sum # Ruby 2.4+
p "********************** Filters **************************"
<<filters
  Filters are methods that are run "before", "after" or "around" a controller action.
  before_action
  after_action
  around_action
  skip_before_action :require_login, only: [:new, :create]
  "around" filters are responsible for running their associated actions by yielding, similar to how Rack
  middlewares work.
filters
p "********************** Callbacks **************************"
<<callbacks
  Callbacks are hooks into the life cycle of an Active Record object
  that allow you to trigger logic before or after an alteration of the object
                    *** Creating an Object ***  *** Updating an Object ***  *** Destroying an Object ***
  before_validation                 T                           T                           
  after_validation                  T                           T                           
  before_save                       T                           T                           
  around_save                       T                           T                           
  before_action                     T                           T                           T
  around_action                     T                           T                           T
  after_action                      T                           T                           T
    action: create/update/destroy
  after_save                        T                           T                           
  after_commit/after_rollback       T                           T                           T
callbacks

p "********************** Meta Programming **************************"
class User
  funs = %w(id first_name last_name created_at updated_at)
  funs.each do |f|
    define_method("find_by_#{f}") do
      p "Select * From User Where #{f} = arg;"
    end
  end
end
User.new.find_by_id

class User
  funs = ['id', 'first_name', 'last_name', 'created_at', 'updated_at']
  funs.each do |n|
    (class << self; self; end).instance_eval do
      define_method("find_by_#{n}") do |arg=nil|
        p "Select * From User Where #{n} = #{arg};"
      end
    end
  end
end
User.find_by_id 1
User.find_by_first_name 'TQR'

p "********************** CSRF **************************"
<<csrf
  What is CSRF? How does Rails protect against it?
  CSRF stands for Cross-Site Request Forgery. This is a form of an attack where the attacker submits a form on
  your behalf to a different website, potentially causing damage or revealing sensitive information.
  In order to protect against CSRF attacks, you can add protect_from_forgery to your ApplicationController.
    protect_from_forgery with: :exception
    <%= csrf_meta_tags %>
  >It protects by including a token in the rendered HTML for your application
   Rails compares the token from the page with the token from the session cookie to ensure they match.
csrf
p "********************** Rails Directory Structure **************************"
<<dir_structure
  Application.rb
    To configure rails component like timezone,
  ApplicationController.rb
    After the router has determined which controller to use for a request
    The controller is responsible for making sense of the request, and producing the appropriate output.
  Enviroment.rb
    Initializes rails application for the environment
dir_structure
p "********************** REST API request types **************************"
<<api
  REST APIs uses multiple standards like HTTP, JSON, URL, and XML
  while SOAP APIs is largely based on HTTP and XML

  GET: Retrieve information...
  POST: Request for the resource at the URI do something with the provided entity...
  PUT: Store an entity at a URI...
  PATCH: Update only the specified fields of an entity at a URI...
  DELETE: Request that a resource be removed...
api
p "********************** MySQL vs PostgreSQL vs MongoDB **************************"
<<db_comparison
  Relational Database:
    A database structured to recognize relations between stored items of information.
  MySQL: is a relational database management system (RDBMS)
    It is a widely chosen for web based projects that need a database simply for straightforward data transactions.
    Doesn’t support full outer join
  PostgreSQL: is an object-RDBMS (ORDBMS) (open-source)
    It is widely used in large systems where read and write speeds are crucial and data needs to validated.
  MongoDB: is an open-source document database and leading NoSQL database.
    Data is stored in JSON-like document
    To improve query speed, MongoDB can store related data together, which is accessed using the MongoDB query language
    MongoDB performance is improved over MySQL because MongoDB does not use joins to connect data, improving performance.
db_comparison
p "********************** ActiveRecord **************************"
<<active_record
  Object in ActiveRecord are class of
    ActiveRecord::Relation
  Active Record Associations:
    belongs_to
    has_one
    has_many
    has_many :through
    has_one :through
    has_and_belongs_to_many

  db:migrate ==> runs (single) migrations that have not run yet.
  db:create ==> creates the database
  db:drop ==> deletes the database
  db:schema:load ==> creates tables and columns within the (existing) database following schema.rb
      If you wanna reset database to schema as provided in schema.rb (This will delete all data)
  db:setup ==> db:create, db:schema:load, db:seed
  db:reset ==> db:drop, db:setup

  bundle exec is a Bundler command to execute a script in the context of the current bundle
  if script is run without bundle exec than it will use the system bundler
  and may result in conflicts with required versions of gem
active_record

p "********************** Complex Relation Examples **************************"
<<associations_exampls
  Same model is parent, child and grandchild
  class Person < ActiveRecord::Base
    belongs_to :parent, class: Person
    has_many :children, class: Person, foreign_key: :parent_id
    has_many :grandchildren, class: Person, through: :children, source: :children
  end
  ********************************
  Rails 5 uses ApplicationRecord instead of ActiveRecord::Base?
  class User < ActiveRecord::Base
    has_one :broadcaster
    has_many :events, class_name: :Event, foreign_key: :broadcaster_id
  end
  class Broadcaster < ApplicationRecord
    belongs_to :user
    belongs_to :school
  end
  class School < ApplicationRecord
    has_many :events, class_name: :Event#, foreign_key: :user_id
    has_many :home_events, class_name: :Event, foreign_key: :home_team_id
    has_many :away_events, class_name: :Event, foreign_key: :away_team_id
    has_many :participants#, foreign_key: :user_id
    has_many :participated_events, through: :participants, source: :event
    has_many :broadcasters
  end
  class Event < ActiveRecord::Base
    belongs_to :school#, foreign_key: :user_id
    belongs_to :home_school, class_name: :School, foreign_key: :home_team_id
    belongs_to :away_school, class_name: :School, foreign_key: :away_team_id
    belongs_to :broadcast_user, class_name: :User, foreign_key: :broadcaster_id
    has_many :participants, dependent: :destroy
    has_many :participated_schools, through: :participants, source: :school#, foreign_key: :user_id
  end
associations_exampls

p "********************** ActiveRecord Queries / Scope **************************"
<<queries
  Scope is like a class method and also it can be applied to result of multiple activerecord_relation objects
  results = User.joins(:broadcaster).where("email LIKE ?", "%#{'sample@gmail.com'}%").select('users.id, broadcasters.id as broadcaster_id')
  User.left_outer_joins(:broadcaster).where(broadcasters: {user_id: nil}).map{|u| [u.email, u.id]}
  self.school.broadcasters.where("id NOT IN (?)", self.id).select("broadcasters.id") # => here self is of Event model
  scope :scope1, -> (id = nil) { joins(:broadcasters).where("broadcasters.id NOT IN (?)", (id ? id : 0) )}
  scope :school_all_events, -> (school_id, participated_event_ids) { where("home_team_id=? OR away_team_id=? OR school_id=? OR id IN (?)", school_id, school_id, school_id, participated_event_ids).sort_by{|e| [e.date, Time.parse(e.date.to_s+" "+e.time).strftime("%R")] }.reverse }
  begin # => unique random 7 figures text
    self.code = [*('a'..'z'),*('0'..'9'),*('A'..'Z')].sample(7).join
  end while self.class.exists?(code: code)

  ActiveRecord::Base.transaction do # => rollback all transactions in this block on error
    raise ActiveRecord::Rollback if any_error_occurs?
  end
queries
p "********************** Eager Loading (preload(), includes(), eager_load() ) **************************"
<<eager_load
  preload()
    Post.order(created_at: :desc).preload(:author)
    it uses two separate queries to load the main data and the associated data.
    Due to its separate queries approach, it will throw an exception in scenarios like "where(name: 'jon')"
  eager_load()
    it always uses the LEFT OUTER JOIN
  includes()
    it may work like preload() when directly applied on model
      OR
    eager_load() when use with 'where'
    depending on the scenarios
eager_load