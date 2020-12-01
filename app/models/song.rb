class Song < ApplicationRecord
    validates :title, presence: true
    validates :title, uniqueness: true, if: :repeat_song? 
    # needed to separate title validations because conditional was applying to both
    validates :release_year, presence: true, if: :released?, numericality: { less_than_or_equal_to: Time.now.year }
    validates :artist_name, presence: { message: "cannot be blank." }

    def repeat_song?
        Song.all.find { |song| song.release_year == self.release_year && song.artist_name == self.artist_name }
        # if song with same release year and artist not found, returns false and title can be repeated
    end

    def released? 
        released == true
    end
end
