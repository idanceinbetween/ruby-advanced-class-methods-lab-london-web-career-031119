require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def self.create
    song = self.new
    self.all << song
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    self.all << song
    song
  end

  def self.find_by_name(name)
    self.all.find{|s| s.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name) == nil
      self.create_by_name(name)
    else
      self.find_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort_by {|x| x.name}
  end

  def self.new_from_filename(file_name)
    song = self.new
    data = file_name.split(" - ")
    song.artist_name = data[0]
    song.name = data[1].gsub(".mp3", "")
    song
  end

  def self.create_from_filename(file_name)
    song = Song.new_from_filename(file_name)
    self.all << song
    song
  end

  def self.destroy_all
    self.all.clear
  end

end
