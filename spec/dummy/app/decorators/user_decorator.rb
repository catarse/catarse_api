class UserDecorator < Draper::Decorator
  decorates :user

  def display_name
    source.name
  end
end

