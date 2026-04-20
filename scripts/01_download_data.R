# ============================================
# 01_download_data.R
# Download equity and market data
# ============================================

library(quantmod)
library(xts)
library(zoo)

if (!dir.exists("data")) dir.create("data", recursive = TRUE)
if (!dir.exists("data/raw")) dir.create("data/raw", recursive = TRUE)

tickers <- c(
  "AAPL", "MSFT", "AMZN", "GOOGL", "META",
  "NVDA", "JPM", "V", "JNJ", "PG",
  "XOM", "HD", "CVX", "MA", "PFE",
  "KO", "PEP", "MRK", "ABBV", "BAC"
)

market <- "^GSPC"
all_symbols <- c(tickers, market)

invisible(
  getSymbols(
    all_symbols,
    src = "yahoo",
    from = "2018-01-01",
    to = "2024-12-31"
  )
)

prices_assets <- do.call(merge, lapply(tickers, function(s) Ad(get(s))))
colnames(prices_assets) <- tickers

prices_market <- Ad(get("GSPC"))
colnames(prices_market) <- "SP500"

prices <- merge(prices_assets, prices_market)
prices <- na.omit(prices)

saveRDS(prices, "data/raw/prices_raw.rds")

cat("Raw price data saved to data/raw/prices_raw.rds\n")
print(head(prices[, 1:6]))