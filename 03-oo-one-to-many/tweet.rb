class Tweet

    attr_reader :user
    attr_accessor :message

    @@all = []

    def initialize(message, user)
        @message = message
        @user = user
        @@all << self
    end

    def self.all 
        @@all
    end

    def username
        @user.username
    end


end
