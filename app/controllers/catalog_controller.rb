class CatalogController < ApplicationController
  skip_before_action :authorize

  def index
    if params[:set_locale]
      redirect_to catalog_index_url(locale: params[:set_locale])
    else
      @products = Product.all
    end
  end
end
