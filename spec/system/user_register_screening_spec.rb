require 'rails_helper'

describe 'User registers movie screening' do
  it 'success' do
    user = FactoryBot.create(:user, name: 'Cesar', email: 'cesar@email.com')
    movie_theater = FactoryBot.create(:movie_theater, name: 'Cine Paradiso', city: 'Brasília')
    movie = FactoryBot.create(:movie, title: 'Star Wars IV', year: 1977, plot: 'Star Wars IV plot', director: 'George Lucas')
    room = FactoryBot.create(:room, movie_theater: movie_theater)
    login_as(user)

    visit root_path
    within('nav') do
      click_on 'Sessões'
    end
    click_on 'Adicionar Sessão'
    select 'Star Wars IV', from: 'Filme'
    select 'Domingo', from: 'Dia da Semana'
    select 'Cine Paradiso - Sala 01', from: 'Sala'
    fill_in 'Horário', with: '18:00'
    click_on 'Criar Sessão'

    expect(page).to have_content("Sessão criada com sucesso")
    screening = Screening.last
    expect(screening.room).to eq room
    expect(screening.movie).to eq movie
  end
end

