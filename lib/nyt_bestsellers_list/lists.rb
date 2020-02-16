class NytBestsellersList::Lists

    attr_accessor :name
    @@all = []

    def initialize(name)
        @name = name
        @book_list = []
        save
    end

    def add_book(book)
    
        @book_list << book
    
    end

    def save
        @@all << self
    end

    def self.current_lists

        fiction_list = self.new("Fiction List")
        author_1 = Author.new("J.K. Rowling")
        book_1 = Book.new("Harry Potter and the Sorcerer's Stone", author_1, "blah, blah, blah, magic!")
        fiction_list.add_book(book_1)
        author_2 = Author.new("Stephen King")
        book_2 = Book.new("The Outsider", author_2, "blah, blah, blah, shudder!")
        fiction_list.add_book(book_2)

        nonfiction_list = self.new("Nonfiction List")
        nonfiction_list.add_book(book_1)
        nonfiction_list.add_book(book_2)

        childrens_list = self.new("Children's List")
        childrens_list.add_book(book_1)
        childrens_list.add_book(book_2)

        @@all

    end

    def print
        @book_list.each do |book|
            puts book.title
            puts book.author.name
            puts book.summary + "\n"

        end
    end

    def self.print_list(num)

        @@all[num].print
    
    end

end