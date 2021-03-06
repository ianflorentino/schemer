class UpdateEventOp < Backend::Op
  include Mixins::EventManagementOp

  field :id

  validates :id, presence: true

  attr_accessor :updated_event

  protected
  
  def perform
    event = Event.find id

    # TODO implement something like pundit/policies
    if !event.user_admin?(current_user)
      errors.add(:current_user, "this action requires an Admin")
      return false
    end

    patch_attributes(event)

    event.save!

    event.reload
    @updated_event = event

    true
  end
end
