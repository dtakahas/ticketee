class Comment < ActiveRecord::Base
  attr_accessible :text, :state_id

  validates :text, :presence => true

  belongs_to :user
  belongs_to :state
  belongs_to :ticket

  after_create :set_ticket_state

  delegate :project, :to => :ticket

private

  def set_ticket_state
    self.ticket.state = self.state
    self.ticket.save!
  end

end
