module Validations
  class InvalidParams < StandardError; end

  def validate_with!(validation)
    validated_results = JSON::Validator.fully_validate(json_schema, validation, errors_as_objects: true)

    raise InvalidParams, validated_results.map { |result| result[:message] }  unless validated_results.blank?
  end

  def json_schema
    Application.root.concat('/app/json_schema/create_ad.json')
  end
end
