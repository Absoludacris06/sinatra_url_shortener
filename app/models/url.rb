class Url < ActiveRecord::Base
  # Remember to create a migration!
  validates :key, uniqueness: true

  before_create :create_key
  before_create :set_count

  private

  def set_count
    self.click_count = 0
  end
  def create_key
    self.key = random_string
    until self.valid?
      self.key = random_string
    end
  end

  def random_string
    (0...8).map{ (('a'..'z').to_a + (0..9).to_a)[rand(36)] }.join
  end
end
