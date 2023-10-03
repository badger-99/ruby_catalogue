class App
  def add_book
    # ** add book logic
  end

  def add_music_album
    # ** add music album logic
  end

  def author_data_feed
    author_first_name = ''
    until check_string?(author_first_name)
      print 'Enter author first name : '
      author_first_name = gets.chomp
      puts ''
      puts 'Invalid name format' unless check_string?(author_first_name)
    end

    author_last_name = ''
    until check_string?(author_last_name)
      print 'Enter author last name : '
      author_last_name = gets.chomp
      puts ''
      puts 'Invalid name format' unless check_string?(author_last_name)
    end
    Author.new(author_first_name, author_last_name)
  end

  def add_game
    # ** add game logic
  end

  def list_books
    # ** list books logic
  end

  def list_music_albums
    # TODO: list music albums
  end

  def list_games
    # TODO: list games
  end

  def list_geners
    # TODO: list geners
  end

  def list_labels
    # TODO: list labels
  end

  def list_authors
    # TODO: list authors
  end
end
