class Author

    attr_accessor :name
    @@all = []

    def initialize(name)
        @name = name
        save
    end

    def save
        @@all << self
    end

    def self.all
        @@all
    end

    def add_book(book)
        book.author = self
    end

    def self.find_by_name(name)
        @@all.find{|person| person.name == self}
    end

    def self.find_or_create_by_name(name)
        if self.find_by_name(name) != nil
            author = self.find_by_name(name)
        else
            author = self.new(name)
        end

        author
    end

    def add_book_by_name(name)
        book = Book.new(name)
        add_book(book)
    end

    def books
        Book.all.select {|book| book.author == self}
    end
end