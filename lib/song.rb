class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    @@all << self.new
    @@all.last
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    @@all << song
    @@all.last
  end

  def self.create_by_name(name)
    song = self.new_by_name(name)
  end

  def self.find_by_name(name)
    foundSong = @@all.detect { |song| song.name == name }
    foundSong
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by { |song| song.name }
  end

  def self.new_from_filename(filename)
    artist = filename.match(/.+(?= - )/).to_s
    song_name = filename.match(/(?<= - ).+(?=.mp3)/).to_s
    song = self.new
    song.artist_name = artist
    song.name = song_name
    @@all << song
    song
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename)
  end

  def self.destroy_all
    self.all.clear
  end

end
