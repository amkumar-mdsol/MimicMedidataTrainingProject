class StudyGroupSerializer < ActiveModel::Serializer
  #attributes :name, :id
  #attributes *StudyGroup.column_names

  attributes :studyGroup, :sites
  def studyGroup
  	object.name   #self => Serializer object, object => current json
  end

  def sites
  	object.sites.map {|study| study.name.upcase }
  end

end
