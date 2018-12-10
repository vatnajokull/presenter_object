class AuthorPresenter < Presenter::Base
  include Presenter::HtmlHelper

  SHORT_DESCRIPTION_LENGTH = 120
  CUSTOM_DATE_FORMAT = '%e %B %Y'

  def full_name
    @object.first_name + ' ' + @object.last_name
  end

  def formatted_period_of_life
    return "was born on #{@object.birth_date.strftime(CUSTOM_DATE_FORMAT)}" unless @object.death_date

    @object.birth_date.strftime(CUSTOM_DATE_FORMAT) + ' - ' + @object.death_date.strftime(CUSTOM_DATE_FORMAT)
  end

  def bestseller_badge
    content_tag(:span, 'BESTSELLER', class: 'badge badge-secondary')
  end

  def main_photo_url
    @object.images.first.file_url
  end

  def short_biography
    @object.biography.first(SHORT_DESCRIPTION_LENGTH)
  end
end
