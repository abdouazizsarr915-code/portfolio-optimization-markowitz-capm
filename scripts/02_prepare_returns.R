# ============================================
# 02_prepare_returns.R
# Prepare returns
# ============================================

library(xts)
library(zoo)

if (!dir.exists("data/processed")) dir.create("data/processed", recursive = TRUE)

prices <- readRDS("data/raw/prices_raw.rds")

returns <- na.omit(diff(log(prices)))

returns_assets <- returns[, 1:20]
returns_market <- returns[, "SP500"]

saveRDS(returns, "data/processed/returns_all.rds")
saveRDS(returns_assets, "data/processed/returns_assets.rds")
saveRDS(returns_market, "data/processed/returns_market.rds")

cat("Returns saved to data/processed/\n")
print(head(returns_assets[, 1:6]))