class HomeController < ApplicationController
  before_action :set_country_list
  before_action :set_years, only: [:jrf_search, :jrsm_search]

  def index
  end

  def jrf_search
    if params[:country].present? && params[:year].present?
      res = EspenApi.new.get_jap_data(params[:country],params[:year])
      body = res[:body]
      @country = body["country"] || params[:country]
      @year = body["year"] || params[:year]
      if res[:status] == 200
        if body["jrf"].present?
          @url = body["jrf"]["url"]
          @data = body["jrf"]["summary"]
          @summary1 = body["jrf"]["summary"]["summary1"]
          @summary2 = body["jrf"]["summary"]["summary2"]
          @summary_inventory = body["jrf"]["summary"]["summary3_inv"]
          @summary_inventory = body["jrf"]["summary"]["summary3_inv"]
        end
        @empty_state = false
      else
        puts "EMPTY"
        @empty_state = true
      end
    end
  end

  def jrsm_search
    if params[:country].present? && params[:year].present?
      res = EspenApi.new.get_jap_data(params[:country],params[:year])
      body = res[:body]
      @country = body["country"] || params[:country]
      @year = body["year"] || params[:year]
      if res[:status] == 200
        if body["jrsm"].present?
          @url = body["jrsm"]["url"]
          @inventory = body["jrsm"]["summary"]["summary_inventory"]
          @donated_medicines = body["jrsm"]["summary"]["summary_donated_medicine"]
        end
        @empty_state = false
      else
        puts "EMPTY"
        @empty_state = true
      end
    end
  end

private

  def set_country_list
    res = EspenApi.new.get_country_list
    @countries = res.map{|r| r["admin0"]}.uniq.sort
  end

  def set_years
    @years = (1999..Date.today.year+1).to_a.reverse
  end

end
