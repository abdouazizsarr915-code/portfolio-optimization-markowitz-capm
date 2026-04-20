# ============================================
# 06_capm_covariance.R
# CAPM covariance matrix
# ============================================

betas <- readRDS("data/processed/betas_capm.rds")
returns_market <- readRDS("data/processed/returns_market.rds")
returns_assets <- readRDS("data/processed/returns_assets.rds")

if (!dir.exists("data/processed")) dir.create("data/processed", recursive = TRUE)

# Make sure betas is a plain numeric vector
betas <- as.numeric(betas)
names(betas) <- colnames(returns_assets)

# Market variance
sigma_m <- as.numeric(var(as.numeric(returns_market)))

# Idiosyncratic variances
residual_var <- numeric(ncol(returns_assets))

for (i in 1:ncol(returns_assets)) {
  model <- lm(as.numeric(returns_assets[, i]) ~ as.numeric(returns_market))
  residual_var[i] <- var(residuals(model))
}

# CAPM covariance matrix
B <- matrix(betas, ncol = 1)
D <- diag(residual_var)

Sigma_capm <- sigma_m * (B %*% t(B)) + D

colnames(Sigma_capm) <- colnames(returns_assets)
rownames(Sigma_capm) <- colnames(returns_assets)

saveRDS(Sigma_capm, "data/processed/Sigma_capm.rds")

cat("CAPM covariance matrix computed\n")
print(round(Sigma_capm[1:6, 1:6], 6))