# ============================================
# 07_capm_portfolio.R
# CAPM-based tangent portfolio and comparison
# ============================================

returns_assets <- readRDS("data/processed/returns_assets.rds")
returns_market <- readRDS("data/processed/returns_market.rds")
betas <- readRDS("data/processed/betas_capm.rds")
Sigma_capm <- readRDS("data/processed/Sigma_capm.rds")
w_tangent <- readRDS("data/processed/w_tangent.rds")

if (!dir.exists("data/processed")) dir.create("data/processed", recursive = TRUE)
if (!dir.exists("figures")) dir.create("figures", recursive = TRUE)

# Inputs
mu_hat <- colMeans(returns_assets)
rf <- 0.02 / 252
mu_m <- mean(as.numeric(returns_market))

# CAPM expected returns
expected_capm <- rf + as.numeric(betas) * (mu_m - rf)
names(expected_capm) <- colnames(returns_assets)

# CAPM tangent portfolio
one_vec <- rep(1, length(expected_capm))
excess_mu_capm <- expected_capm - rf * one_vec

w_capm_unnormalized <- solve(Sigma_capm) %*% excess_mu_capm
w_capm <- as.vector(w_capm_unnormalized / sum(w_capm_unnormalized))
names(w_capm) <- colnames(returns_assets)

mu_capm <- sum(w_capm * expected_capm)
sd_capm <- sqrt(as.numeric(t(w_capm) %*% Sigma_capm %*% w_capm))
sharpe_capm <- (mu_capm - rf) / sd_capm

saveRDS(w_capm, "data/processed/w_capm.rds")
saveRDS(expected_capm, "data/processed/expected_capm.rds")

cat("CAPM tangent portfolio estimated\n")
cat("Mean =", round(mu_capm, 6), "\n")
cat("SD =", round(sd_capm, 6), "\n")
cat("Sharpe =", round(sharpe_capm, 6), "\n")

# Comparison plot
comparison_df <- cbind(w_tangent, w_capm)
rownames(comparison_df) <- colnames(returns_assets)

png("figures/weights_comparison.png", width = 950, height = 700)
matplot(comparison_df,
        type = "h",
        lwd = 3,
        lty = 1,
        main = "Portfolio Weights: Markowitz vs CAPM",
        ylab = "Weight",
        xaxt = "n")
axis(1, at = 1:nrow(comparison_df), labels = rownames(comparison_df), las = 2, cex.axis = 0.8)
legend("topright", legend = c("Markowitz", "CAPM"), lty = 1, lwd = 3)
dev.off()