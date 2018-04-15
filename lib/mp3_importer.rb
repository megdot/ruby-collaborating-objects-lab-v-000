class MP3Importer
  attr_accessor :file_path

  def initialize(file_path)
    @file_path = file_path
  end

  def files
    @files = Dir.entries(@file_path)
    @files.delete_if{|file| file == "." || file == ".."}
  end

  def import
    self.files.each do |file|
      song = Song.new_by_filename(file)
      Artist.all << song.artist unless Artist.all.include?(song.artist)
    end
  end

end
