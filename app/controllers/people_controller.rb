class PeopleController < ApplicationController
  require "open-uri"
  require "nokogiri"

  def create
    #get actor results based on birthday
    @birthday = params['birthday']
    document = open('http://www.imdb.com/search/name?birth_monthday=' + @birthday)
    content = document.read
    parsed_content = Nokogiri::HTML(content)

    #mostKnownWork details

    parsed_content.css('.lister-item').map do |item|
      knownWorkDoc = open("http://www.imdb.com" + item.css('p').first.css('a').attribute('href').value)
      workContent = knownWorkDoc.read
      parsed_work_content = Nokogiri::HTML(workContent)
      People.find_or_create_by(
        name: item.css('.lister-item-header').css('a').inner_html.strip,
        birthday: @birthday,
        photoUrl: item.css('.lister-item-image').css('img').attribute('src').value,
        profileUrl: "http://www.imdb.com" + item.css('.lister-item-header').css('a').attribute('href').value,
        title: item.css('.lister-item-content').css('p').first.css('a').inner_text.strip,
        url: "http://www.imdb.com" + item.css('.lister-item-content').css('p').css('a').attribute('href').value,
        rating: parsed_work_content.css('.ratingValue').css('span').first.inner_text.to_f,
        director: parsed_work_content.css('.credit_summary_item').first.css('a').css('span').inner_text.strip
      )
    end

    people = People.all.where(birthday: @birthday)

    render json: people

  end

  def show
    @birthday = params['birthday']
    people = People.all.where(birthday: @birthday)

    render json: people

  end

end
