class Item
  attr_accessor :publish_date
  attr_reader: :id, :genre, :author, :source, :label, :archived
  
  def initialize(genre,, author, source, label, date, archived: false)
    @id = Random.rand(1..1000)
    set_genre(genre)
    set_author(author)
    set_source(source)
    set_label(label)
    @publish_date = parse_date(date)
    @archived = archived
  end

  def set_genre(genre)
    @genre = genre
    genre.array.push(self) unless genre.array.include?(self)
    end
  end

  def set_author(author)
    @author = author
    author.array.push(self) unless author.array.include?(self)
    end
  end

  def set_source(source)
    @source = source
    source.array.push(self) unless source.array.include?(self)
    end
  end

  def set_label(label)
    @label = label
    label.array.push(self) unless label.array.include?(self)
    end
  end

end
