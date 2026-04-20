# ============================================
# 04_capm_beta.R
# Estimate CAPM betas
# ============================================

returns_assets <- readRDS("data/processed/returns_assets.rds")
returns_market <- readRDS("data/processed/returns_market.rds")

betas <- numeric(ncol(returns_assets))
names(betas) <- colnames(returns_assets)

for (i in 1:ncol(returns_assets)) {
  model <- lm(returns_assets[, i] ~ returns_market)
  betas[i] <- coef(model)[2]
}

saveRDS(betas, "data/processed/betas_capm.rds")

cat("CAPM betas estimated\n")
print(round(betas, 4))