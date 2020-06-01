class AdRoutes < Application
  namespace '/v1/ads' do
    get do
      ads = Ad.order(:updated_at)
      serializer = AdSerializer.new(ads.all, meta: { count: ads.count })

      json serializer.serializable_hash
    end

    post do
      content_type :json

      if request.body.is_a?(StringIO)
        ad_params = JSON.parse(request.body.read).deep_symbolize_keys!
      end

      validate_with!(ad_params)

      result = Ads::CreateService.call(
        ad: ad_params[:ad],
        user_id: ad_params[:user_id]
      )

      if result.success?
        serializer = AdSerializer.new(result.ad)

        status 201
        json serializer.serializable_hash
      else
        status 422
        error_response result.ad
      end
    end
  end
end
