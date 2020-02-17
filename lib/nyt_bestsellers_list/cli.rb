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
            case input
                when "1"
                    fiction_menu
                when "2"
                    nonfiction_menu
                when "3"
                    childrens_menu
                when "4"
                    about
            end
        end
    end

    # May need to create Menu Module?
    def main_menu
        puts <<~Doc
            Welocome to the New York Times Bestsellers List!
            Please choose one of the following options to get started:
            1. Fiction
            2. Nonfiction
            3. Children's
            4. About
        Doc
    end

    def fiction_menu
        puts <<~Doc
            Which of the following lists for Fiction would you like to view?
            1. Combined Print & E-book Fiction
            2. Hardcover Fiction
            3. Paperback Trade Fiction
            0. Main Menu
        Doc
        puts "Enter your choice here:"
        input = gets.strip
        case input
            when "1"
                @list.print_list(0)
            when "2"
                @list.print_list(2)
            when "3"
                @list.print_list(4)
            when "0"
                main_menu
        end
    end

    def nonfiction_menu
        puts <<~Doc
            Which of the following lists for Nonfiction would you like to view?
            1. Combined Print & E-book Nonfiction
            2. Hardcover Nonfiction
            3. Paperback Nonfiction
            4. Advice, How-To & Miscellaneous
            0. Main Menu
        Doc

        puts "Enter your choice here:"
            input = gets.strip
            case input
                when "1"
                    @list.print_list(1)
                when "2"
                    @list.print_list(3)
                when "3"
                    @list.print_list(5)
                when "4"
                    @list.print_list(6)
                when "0"
                    main_menu
            end

    end

    def childrens_menu
        puts <<~Doc
            Which of the following lists for Children's would you like to view?
            1. Children's Middle Grade Hardcover
            2. Children's Picture Books
            3. Children's Series
            4. Yound Adult Hardcover
            0. Main Menu
        Doc

        puts "Enter your choice here:"
        input = gets.strip
        case input
                when "1"
                    @list.print_list(7)
                when "2"
                    @list.print_list(8)
                when "3"
                    @list.print_list(9)
                when "4"
                    @list.print_list(10)
                when "0"
                    main_menu
        end

    end

    def about
        puts <<~Doc
            This gem allows the user to view the current Weekly Bestsellers list from the New York Times.
            The bestsellers list is based on current sales within the United States.
        
            How to use this program:
            Select the provided choices from the menu. If you would like to Exit the program, just type 'Exit'
        Doc

        puts "Enter 0 to go back to the Main Menu or EXIT to leave the program:"
        input = gets.strip
        case input
            when "0"
                main_menu
        end
    end
end