statsVK <- function(vk_token, acc_id, startdate, campaign_ids, o_type = "campaign", stat_period = "day", ...)
{
  library("jsonlite")
  dots <- list(...)
  if("lib" %in% names(dots))
  {
    library("httr", lib.loc = dots[["lib"]])
  }
  else
  {
    library("httr")
  }
  if("enddate" %in% names(dots))
  {
    end = dots[["enddate"]]
  }
  else
  {
    end <- as.Date(Sys.Date(), "YYYY-MM-DD")
  }
  vk_stats <- POST("https://api.vk.com/method/ads.getStatistics", body = list(
    access_token = vk_token,
    account_id = acc_id,
    ids_type = o_type,
    ids = campaign_ids,
    period = stat_period,
    date_from = startdate,
    date_to = end
  ))
  vk_stats = content(vk_stats)
  vk_stats = vk_stats$response
  vk_json <- jsonlite::toJSON(vk_stats)
  return(vk_json)
}
