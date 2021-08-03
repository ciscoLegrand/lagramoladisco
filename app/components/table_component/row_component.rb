class TableComponent::RowComponent < ViewComponent::Base
  renders_one :actions, "RowActionComponent"

  attr_reader :cells
  def initialize(cells:)
    @cells = cells
  end

  class RowActionComponent < ViewComponent::Base
    def call
      tag.td content
    end

    def render?
      content.present?
    end
  end
end