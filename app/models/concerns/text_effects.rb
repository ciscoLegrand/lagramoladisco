module TextEffects
  extended ActiveSupport::Concern

  def parallax
    self.parallax? ? 'Avtivado' : 'desactivado'
  end

  def visible 
    self.visible? ? 'Si' : 'No'
  end

  def body_truncate
    self.body.to_s.truncate(25, omission: '... ')
  end
end