cat("========================================\n")
cat(" Running Portfolio Optimization Project \n")
cat("========================================\n\n")

cat("Step 1: Download data\n")
source("scripts/01_download_data.R")

cat("\nStep 2: Prepare returns\n")
source("scripts/02_prepare_returns.R")

cat("\nStep 3: Markowitz optimization\n")
source("scripts/03_markowitz.R")

cat("\nStep 4: Efficient frontier\n")
source("scripts/04_efficient_frontier.R")

cat("\nStep 5: CAPM betas\n")
source("scripts/05_capm_beta.R")

cat("\nStep 6: CAPM covariance\n")
source("scripts/06_capm_covariance.R")

cat("\nStep 7: CAPM portfolio\n")
source("scripts/07_capm_portfolio.R")

cat("\n========================================\n")
cat(" Project completed successfully\n")
cat("========================================\n")