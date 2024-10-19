# create a new Class, User, that has the following attributes:
# - name
# - email
# - password


# create a new Class, Room, that has the following attributes:
# - name
# - description
# - users

# create a new Class, Message, that has the following attributes:
# - user
# - room
# - content

# add a method to user so, user can enter to a room
# user.enter_room(room)

# add a method to user so, user can send a message to a room
# user.send_message(room, message)
# user.ackowledge_message(room, message)

# add a method to a room, so it can broadcast a message to all users
# room.broadcast(message)


class User
    attr_accessor :name, :email, :password
  
    def initialize(name, email, password)
      @name, @email, @password, @rooms = name, email, password, []
    end
  
    def enter_room(room)
      room.add_user(self) unless @rooms.include?(room)
    end
  
    def send_message(room, content)
      room.broadcast(Message.new(self, room, content))
    end
  
    def acknowledge_message(message)
      puts "#{@name} acknowledged message: '#{message.content}'"
    end
  end
  
  class Room
    attr_accessor :name, :description, :users
  
    def initialize(name, description)
      @name, @description, @users = name, description, []
    end
  
    def add_user(user)
      @users << user unless @users.include?(user)
    end
  
    def broadcast(message)
      puts "\nRoom:'#{@name}' broadcast: '#{message.content}'"
      @users.each { |user| user.acknowledge_message(message) }
    end
  end
  
  class Message
    attr_accessor :user, :room, :content
  
    def initialize(user, room, content)
      @user, @room, @content = user, room, content
    end
  end
  
  # Example usage
  b1 = User.new("B1", "B1@example.com", "pass123")
  b2 = User.new("B2", "B2@example.com", "pass456")
  room = Room.new("Ruby Room","VUVU")
  
  b1.enter_room(room)
  b2.enter_room(room)
  
  b1.send_message(room, "Hello, everyone!")
  b2.send_message(room, "Hello, guy!")
  