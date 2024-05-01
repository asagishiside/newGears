class Gear < ApplicationRecord
  belongs_to :brand
  has_many :posts
  has_many_attached :images

  enum gear_type: { board: 0, binding: 1, boots: 2}

  validates :brand, presence: true
  validates :name, presence: true

  def self.search(query)
    return recent_gears if query.blank?
    logger.debug "query: #{query}"
    sanitized_keywords = sanitize_keywords(query)

    case sanitized_keywords.size
    when 1
      search_single_keyword(sanitized_keywords.first)
    else
      search_multiple_keywords(sanitized_keywords)
    end
  end

  def self.recent_gears
    order(updated_at: :desc).limit(10)
  end

  def self.sanitize_keywords(query)
    keywords = query.split(/[[:blank:]]+/)
    keywords.map { |keyword| ActiveRecord::Base.sanitize_sql_like(keyword) }
  end

  def self.search_single_keyword(keyword)
    joins(:brand).where('gears.name LIKE ? OR brands.name LIKE ?', "%#{keyword}%", "%#{keyword}%")
  end

  def self.search_multiple_keywords(keywords)
    combinations = keywords.permutation.to_a
    conditions = self.none

    combinations.each do |combo|
      condition = joins(:brand).where('gears.name LIKE ? OR brands.name LIKE ?', "%#{combo[0]}%", "%#{combo[1]}%")
      conditions = conditions.or(condition)
    end

    conditions
  end


end
