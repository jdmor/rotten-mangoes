class Movie < ActiveRecord::Base

  mount_uploader :poster_image, MovieImageUploader

  has_many :reviews

  validates :title,
    presence: true

  validates :director,
    presence: true

  validates :runtime_in_minutes,
    numericality: { only_integer: true }

  validates :description,
    presence: true

  validates :release_date,
    presence: true

  validate :release_date_is_in_the_past

  default_scope { order(:release_date).reverse_order }

  scope :recent, -> { where("release_date > ?", Date.today - 60)}

  def release_date_is_in_the_past
    if release_date.present?
      errors.add(:release_date, 'should be in the past') if release_date > Date.today
    end
  end

  def review_average
    reviews.sum(:rating_out_of_ten)/reviews.size if reviews.any?
  end

  class << self

    def query?(params)
      (params[:search_term] && !params[:search_term].empty?) ||
      (params[:runtime_in_minutes] && !params[:runtime_in_minutes].empty?)
    end

    # Custom scope

    def runtime_in_minutes(filter)
      case filter
      when 'less_than_90'
        where('runtime_in_minutes < 90')
      when 'between_90_and_120'
        where('runtime_in_minutes BETWEEN 90 AND 120')
      when 'greater_than_120'
        where('runtime_in_minutes > 120')
      else
        where('')
      end
    end

    def title_or_director(term)
      term = '%' + term + '%'
      where("title LIKE ? OR director LIKE ?", term, term)
    end
  end

end