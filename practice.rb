# create a new Class, User, that has the following attributes:
# - name
# - email
# - password
class User
    attr_accessor :name, :email, :password
  
    def initialize(name, email, password)
      @name = name
      @email = email
      @password = password
    end
  end
  
  user1 = User.new("Teerakrop", "teerakrop.inpr@bumail.net", "123456789")
  
  puts "Name: #{user1.name}"
  puts "Email: #{user1.email}"
  puts "Password: #{user1.password}"
  
# create a new Class, Room, that has the following attributes:
# - name
# - description
# - users
  room1 = Room.new("MonkeyRoom", "A room for monkey discussions")
  
  puts "Room Name: #{room1.name}"
  puts "Description: #{room1.description}"
  puts "Users: #{room1.users.inspect}"

# create a new Class, Message, that has the following attributes:
# - user
# - room
# - content
  user1 = User.new("Teerakrop", "teerakrop.inpr@bumail.net", "123456789")
  room1 = Room.new("MonkeyRoom", "A room for monkey discussions")
  
  message1 = Message.new(user1, room1, "Hello, Monkey!")
  
  puts "User: #{message1.user.name}"
  puts "Room: #{message1.room.name}"
  puts "Message Content: #{message1.content}"  

# add a method to user so, user can enter to a room
# user.enter_room(room)
    def enter_room(room)
      unless @rooms.include?(room)
        @rooms << room
        room.add_user(self)
        puts "#{name} has entered the room: #{room.name}"
      else
        puts "#{name} is already in the room: #{room.name}"
      end
    end
  end
  
  class Room
    attr_accessor :name, :description, :users
  
    def initialize(name, description)
      @name = name
      @description = description
      @users = []
    end
  
    def add_user(user)
      @users << user unless @users.include?(user)
    end
  end
  
  user1 = User.new("Teerakrop", "teerakrop.inpr@bumail.net", "123456789")
  room1 = Room.new("MonkeyRoom", "A room for monkey discussions")
  
  user1.enter_room(room1)
  
  puts "Users in #{room1.name}: #{room1.users.map(&:name).join(', ')}"

# add a method to user so, user can send a message to a room
# user.send_message(room, message)
# user.ackowledge_message(room, message)
    def send_message(room, content)
      if @rooms.include?(room)
        message = Message.new(self, room, content)
        room.broadcast(message)
      else
        puts "#{name} is not in the room: #{room.name}"
      end
    end

    def acknowledge_message(room, message)
      if @rooms.include?(room)
        puts "#{name} has acknowledged the message in room #{room.name}: #{message.content}"
      else
        puts "#{name} is not in the room: #{room.name}"
      end
    end
  end
  
  class Room
    attr_accessor :name, :description, :users
  
    def initialize(name, description)
      @name = name
      @description = description
      @users = [] 
    end

    def add_user(user)
      @users << user unless @users.include?(user)
    end

    def broadcast(message)
      puts "Broadcasting message in room #{name}: #{message.content}"
      @users.each do |user|
        user.acknowledge_message(self, message) unless user == message.user
      end
    end
  end
  
  class Message
    attr_accessor :user, :room, :content
  
    def initialize(user, room, content)
      @user = user
      @room = room
      @content = content
    end
  end
  
  user1 = User.new("Teerakrop", "teerakrop.inpr@bumail.net", "123456789")
  room1 = Room.new("MonkeyRoom", "A room for monkey discussions")

  user1.enter_room(room1)
  user1.send_message(room1, "Hello, everyone! How are you?")

  puts "Users in #{room1.name}: #{room1.users.map(&:name).join(', ')}"
  

# add a method to a room, so it can broadcast a message to all users
# room.broadcast(message)
    def broadcast(message)
      puts "Broadcasting message in room #{name}: #{message.content}"
      @users.each do |user|
        user.acknowledge_message(self, message) unless user == message.user
      end
    end
  end
  
  class Message
    attr_accessor :user, :room, :content
  
    def initialize(user, room, content)
      @user = user
      @room = room
      @content = content
    end
  end
  
  user1 = User.new("Teerakrop", "teerakrop.inpr@bumail.net", "123456789")
  room1 = Room.new("MonkeyRoom", "A room for monkey discussions")
  
  user1.enter_room(room1)
  user1.send_message(room1, "Hello, everyone! How are you?")
  
  puts "Users in #{room1.name}: #{room1.users.map(&:name).join(', ')}"