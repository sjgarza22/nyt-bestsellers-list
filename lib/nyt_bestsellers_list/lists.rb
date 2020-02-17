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

    def self.all
        @@all
    end

    def self.current_lists
        self.scrape_lists
        @@all
    end

    def self.scrape_lists
        doc = Nokogiri::HTML(open(MAIN_URL))
        @list_urls = []
        doc.css("a.css-nzgijy").each {|link| @list_urls << "https://www.nytimes.com#{link['href']}"}
            @list_urls.each do |url|
                list_doc = Nokogiri::HTML(open(url))
                @list = self.new(list_doc.at_css("h1").children.first.text.strip)

                data = list_doc.search("article.css-1u6k25n").each do |d|
                    book = Book.find_or_create_by_doc(d)
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
        self.all[num.to_i - 1].print  
    end

    def self.print_list_names
        self.all.each_with_index {|list, index| puts "#{index + 1}. #{list.name}"}
    end

end