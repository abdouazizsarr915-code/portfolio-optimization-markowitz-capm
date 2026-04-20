# Portfolio Optimization using Markowitz and CAPM

## Overview

This project implements portfolio optimization techniques using both the **Markowitz Mean-Variance framework** and the **Capital Asset Pricing Model (CAPM)**.

It compares the performance of data-driven covariance estimation (Markowitz) with a factor-based approach (CAPM).

---

## Objectives

- Compute daily returns for multiple assets  
- Estimate optimal portfolio using Markowitz  
- Construct the Efficient Frontier  
- Estimate CAPM betas  
- Build the Security Market Line (SML)  
- Compute CAPM-implied covariance matrix  
- Compare Markowitz vs CAPM portfolio performance  

---

## Project Structure
scripts/
01_download_data.R
02_prepare_returns.R
03_markowitz.R
04_efficient_frontier.R
05_capm_beta.R
06_capm_covariance.R
07_capm_portfolio.R
08_run_project.R

data/
figures/
report/

---

## Methodology

- **Data**: Stock returns (AAPL, MSFT, AMZN, GOOGL, META, NVDA, etc.)  
- **Model 1**: Markowitz Mean-Variance Optimization  
- **Model 2**: CAPM (single-factor model)  
- **Risk measure**: Volatility (standard deviation)  
- **Performance metric**: Sharpe Ratio  

---

## Results

- Markowitz portfolio achieves a higher Sharpe ratio  
- CAPM portfolio is more constrained due to single-factor structure  
- Empirical covariance provides better diversification  
- Efficient frontier shows risk-return trade-off  

---

## Visual Results

### Efficient Frontier
![Frontier](figures/efficient_frontier.png)

### Security Market Line
![SML](figures/sml.png)

---

## Key Insight

The Markowitz portfolio outperforms the CAPM portfolio in terms of Sharpe ratio, indicating that a full covariance approach captures asset relationships better than a single-factor model.

---

## How to Run

```r
source("scripts/08_run_project.R")
```
Author

Abdoul Sarr