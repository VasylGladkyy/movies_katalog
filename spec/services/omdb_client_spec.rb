# frozen_string_literal: true

require 'rails_helper'

describe OmdbClient do
  before do
    @omdb_client = OmdbClient.instance
    @id = 'tt3569230'
    @title = 'Legend'
  end

  describe 'Find by id' do
    it 'Find by id not null' do
      actual = @omdb_client.by_id(id: @id)
      expect(actual).not_to eq(nil)
    end

    it 'Find by id corectly ' do
      actual = @omdb_client.by_id(id: @id)
      expect(actual['imdbID']).to eq(@id)
      expect(actual[:Title]).to eq(@Title)
    end

    it 'if id incorect' do
      actual = @omdb_client.by_id(id: 'asdasdasdadasd')
      expect(actual).to eq(nil)
    end
  end

  describe 'Find by title' do
    it 'responce not null' do
      actual = @omdb_client.by_title(title: @title)
      expect(actual).not_to eq(nil)
    end

    it 'responce corectly' do
      actual = @omdb_client.by_title(title: @title)
      expect(actual['imdbID']).to eq(@id)
      expect(actual[:Title]).to eq(@Title)
    end

    it 'if title incorect' do
      actual = @omdb_client.by_title(title: 'asdasdasdadasd')
      expect(actual).to eq(nil)
    end
  end

  describe 'Find by title and id' do
    it 'Find by id and title not null' do
      actual = @omdb_client.by_id_and_title(id: @id, title: @title)
      expect(actual).not_to eq(nil)
    end

    it 'Find by id and title corectly' do
      actual = @omdb_client.by_id_and_title(id: @id, title: @title)
      expect(actual['imdbID']).to eq(@id)
      expect(actual[:Title]).to eq(@Title)
    end
  end
end
