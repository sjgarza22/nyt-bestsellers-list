class Book

    attr_accessor :title, :author, :publisher, :summary
    @@all = []

    def initialize(title)
        @title = title
        save
    end

    def save
        @@all << self
    end

    def self.all
        @@all
    end

    def self.find_by_name(name)
        self.all.find {|book| book.title == self}
    end

    def self.find_or_create_by_name(name)
        if self.find_by_name(name) != nil
            book = self.find_by_name(name)
        else
            book = self.new(name)
        end
        book
    end

    def self.find_or_create_by_doc(doc)
        if self.find_by_name(doc.search("h3").text.strip) != nil
            book = self.find_by_name(doc.search("h3").text.strip)
        else
            book = self.new(doc.search("h3").text.strip)
            count = 0
            doc.search("p").each do |content|
                case count
                when 1
                    book.author_name = content.text.strip
                when 2
                    book.publisher = content.text.strip
                when 3
                    book.summary = content.text.strip
                end

                count += 1
            end
        end
        book
    end

    def author_name=(name)
        if Author.find_by_name(name) != nil
            self.author = Author.find_by_name(name)
        else
            author = Author.new(name)
            self.author = author
        end
    end

end