require 'rails_helper'

describe 'User views screenings' do 
  it 'from the landing page' do
    user = FactoryBot.create(:user, name: 'Cesar', email: 'cesar@email.com')
    movie_theater = FactoryBot.create(:movie_theater, name: 'Cine Paradiso', city: 'Brasília')
    movie = FactoryBot.create(:movie, title: 'Star Wars IV', year: 1977, plot: 'Star Wars IV plot', director: 'George Lucas')
    room = FactoryBot.create(:room, movie_theater: movie_theater)
    screening = FactoryBot.create(:screening, room: room, weekday: 0, movie: movie, start_time: Time.zone.local(1000, 1, 1, 18, 0, 0))
    login_as(user)

    visit root_path
    within('nav') do
      click_on 'Sessões'
    end

    within('#screenings-table') do
      expect(page).to have_content("Filme")
      expect(page).to have_content("Sala")
      expect(page).to have_content("Horário")
      expect(page).to have_content("Dia da Semana")
      expect(page).to have_content("Cine Paradiso")
      expect(page).to have_content("Star Wars IV")
      expect(page).to have_content("Terça-feira")
      expect(page).to have_content("18:00")
    end
  end
end