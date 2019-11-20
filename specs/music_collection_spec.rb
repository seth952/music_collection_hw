require('minitest/autorun')
require('minitest/reporters')
require_relative('../models/album')


Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

class AlbumTest < MiniTest::Test

  def can_create_new_album
    album_details = {
      'title' => 'Back in Black',
      'genre' => 'Rock',

    }

    new_album = Album.new(album_details)
    assert_equal('title', new_album.title)
  end


end
