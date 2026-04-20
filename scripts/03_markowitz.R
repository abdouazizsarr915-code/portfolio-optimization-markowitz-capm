# ============================================
# 03_markowitz.R
# Markowitz tangent portfolio and efficient frontier
# ============================================

returns_assets <- readRDS("data/processed/returns_assets.rds")

if (!dir.exists("figures")) dir.create("figures", recursive = TRUE)

mu_hat <- colMeans(returns_assets)
Sigma_hat <- cov(returns_assets)

rf <- 0.02 / 252
one_vec <- rep(1, length(mu_hat))
excess_mu <- mu_hat - rf * one_vec

w_tangent_unnormalized <- solve(Sigma_hat) %*% excess_mu
w_tangent <- as.vector(w_tangent_unnormalized / sum(w_tangent_unnormalized))
names(w_tangent) <- colnames(returns_assets)

mu_tangent <- sum(w_tangent * mu_hat)
sd_tangent <- sqrt(as.numeric(t(w_tangent) %*% Sigma_hat %*% w_tangent))
sharpe_tangent <- (mu_tangent - rf) / sd_tangent

saveRDS(mu_hat, "data/processed/mu_hat.rds")
saveRDS(Sigma_hat, "data/processed/Sigma_hat.rds")
saveRDS(w_tangent, "data/processed/w_tangent.rds")

cat("Markowitz tangent portfolio estimated\n")
cat("Mean =", round(mu_tangent, 6), "\n")
cat("SD =", round(sd_tangent, 6), "\n")
cat("Sharpe =", round(sharpe_tangent, 6), "\n")

# Efficient frontier
target_returns <- seq(min(mu_hat), max(mu_hat) + 0.001, length.out = 100)
frontier_sd <- numeric(length(target_returns))

for (i in seq_along(target_returns)) {
  target <- target_returns[i]
  
  A <- as.numeric(t(one_vec) %*% solve(Sigma_hat) %*% one_vec)
  B <- as.numeric(t(one_vec) %*% solve(Sigma_hat) %*% mu_hat)
  C <- as.numeric(t(mu_hat) %*% solve(Sigma_hat) %*% mu_hat)
  D <- A * C - B^2
  
  lambda1 <- (C - B * target) / D
  lambda2 <- (A * target - B) / D
  
  w <- solve(Sigma_hat) %*% (lambda1 * one_vec + lambda2 * mu_hat)
  frontier_sd[i] <- sqrt(as.numeric(t(w) %*% Sigma_hat %*% w))
}

png("figures/efficient_frontier.png", width = 900, height = 650)
plot(frontier_sd, target_returns, type = "l", lwd = 2,
     main = "Efficient Frontier and Tangent Portfolio",
     xlab = "Portfolio Volatility",
     ylab = "Portfolio Return")
points(sd_tangent, mu_tangent, pch = 19, cex = 1.2)
dev.off()