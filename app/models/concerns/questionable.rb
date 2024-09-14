module Questionable
  extend ActiveSupport::Concern

  def get_type
    self.class.name
  end
end