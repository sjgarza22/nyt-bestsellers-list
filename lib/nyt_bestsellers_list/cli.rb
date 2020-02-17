class NytBestsellersList::CLI

    def call
        @list = NytBestsellersList::Lists
        @list.current_lists
        main_menu
        menu
    end

    def menu
        input = nil
        while input != "exit"
            puts "Enter the number of the list you'd like more info on:"
            input = gets.strip.downcase
            NytBestsellersList::Lists.print_list(input)
        end
    end

    # May need to create Menu Module?
    def main_menu
        puts <<~Doc
            Welocome to the New York Times Bestsellers List!
            Please choose one of the following options to get started:
        Doc
        NytBestsellersList::Lists.print_list_names
    end
end