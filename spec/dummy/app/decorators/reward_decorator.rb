class RewardDecorator < Draper::Decorator
  decorates :reward

  def display_deliver_estimate
    I18n.l(source.deliver_at, format: :estimate)
  rescue
    source.deliver_at
  end
end
