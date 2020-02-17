class NytBestsellersList::Lists

    attr_accessor :name, :url
    MAIN_URL = 'https://www.nytimes.com/books/best-sellers/'
    @@all = []

    def initialize(name)
        @name = name
        @book_list = []
        save
    end

    def add_book=(book)
    
        @book_list << book
    
    end

    def save
        @@all << self
    end

    def self.current_lists

        self.scrape_lists

        @@all

    end

    def self.scrape_lists
        doc = Nokogiri::HTML(open(MAIN_URL))
        @list_urls = doc.css("a.css-nzgijy").map {|link| "https://www.nytimes.com#{link['href']}"}
            @list_urls.each do |url|
                list_doc = Nokogiri::HTML(open(url))
                @list = self.new(list_doc.search("h1").first.text.strip)

                data = list_doc.search("article.css-1u6k25n").each do |d|
                    book = Book.new(d.search("h3").text.strip)
                    count = 0
                    d.search("p").each do |content|
                        case count
                        when 1
                            author = Author.new(content.text.strip)
                            book.author = author
                        when 2
                            book.publisher = content.text.strip
                        when 3
                            book.summary = content.text.strip
                        end

                        count += 1
                    end
                    @list.add_book = book
                end
            end
    end

    def print
        @book_list.each do |book|
            puts book.title
            puts book.author.name
            puts book.summary + "\n\n"

        end
    end

    def self.print_list(num)

        @@all[num].print
    
    end

end