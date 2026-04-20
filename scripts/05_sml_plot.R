# ============================================
# 05_sml_plot.R
# Security Market Line (SML)
# ============================================

betas <- readRDS("data/processed/betas_capm.rds")
returns_assets <- readRDS("data/processed/returns_assets.rds")

if (!dir.exists("figures")) dir.create("figures", recursive = TRUE)

mu_hat <- colMeans(returns_assets)

rf <- 0.02 / 252
market_premium <- mean(readRDS("data/processed/returns_market.rds")) - rf

expected_returns_capm <- rf + betas * market_premium

# Plot SML
png("figures/sml_plot.png", width = 900, height = 650)

plot(betas, mu_hat,
     pch = 19,
     main = "Security Market Line (SML)",
     xlab = "Beta",
     ylab = "Expected Return")

# SML line
beta_seq <- seq(min(betas), max(betas), length.out = 100)
lines(beta_seq, rf + beta_seq * market_premium, col = "red", lwd = 2)

# Labels
text(betas, mu_hat, labels = names(betas), pos = 3, cex = 0.7)

dev.off()

cat("SML plot saved in figures/sml_plot.png\n")