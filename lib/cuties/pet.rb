class Pet
  
  attr_reader :id,
              :link,
              :name,
              :sex,
              :breed,
              :type,
              :desc,
              :pic

  def initialize(attributes)
    @id    = attributes[:id]
    @link  = attributes[:link]
    @name  = attributes[:name]
    @sex   = attributes[:sex]
    @breed = attributes[:breed]
    @type  = attributes[:type]
    @desc  = attributes[:desc]
    @pic   = attributes[:pic]
  end

  def to_s
    name
  end

  def error?
    # attributes['code']
  end
end
