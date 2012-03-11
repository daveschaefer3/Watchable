module ApplicationHelper
  def title_sentence
    # used in the title tag
    [@title_1, @title_2, @title_3, @title_4, @title_5].to_sentence
  end

  def title_review_list
    # used in the meta description tag
    @title_1 << " review, " <<
    @title_2 << " review, " <<
    @title_3 << " review, " <<
    @title_4 << " review, " <<
    @title_5 << " review"
  end
  
  def slug_line
    # used as the site's slogan of-sorts
    "Movies worth watching, " << Date.today.strftime('%b ') << Date.today.strftime('%d').to_i.ordinalize << "."
  end
end