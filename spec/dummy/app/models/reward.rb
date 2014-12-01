# coding: utf-8
class Reward < ActiveRecord::Base
  belongs_to :project

  delegate :display_deliver_estimate, :display_remaining, :name, :display_minimum, :short_description,
           :medium_description, :last_description, :display_description, to: :decorator

  def decorator
    @decorator ||= RewardDecorator.new(self)
  end

  def sold_out?
    maximum_contributions && total_compromised >= maximum_contributions
  end

  def remaining
    return nil unless maximum_contributions
    maximum_contributions - total_compromised
  end
end

