# Portfolio Optimization using Markowitz and CAPM

## Overview

This project implements portfolio optimization techniques using both the **Markowitz Mean-Variance framework** and the **Capital Asset Pricing Model (CAPM)**.

It compares the performance of empirical covariance estimation with a factor-based covariance structure derived from CAPM.

---

## Objectives

- Compute daily returns for a cross-section of equities  
- Estimate the Markowitz tangent portfolio  
- Plot the Efficient Frontier  
- Estimate CAPM betas  
- Build the Security Market Line (SML)  
- Construct the CAPM-implied covariance matrix  
- Compare Markowitz and CAPM portfolio allocations  

---

## Project Structure
scripts/
01_download_data.R
02_prepare_returns.R
03_markowitz.R
04_capm_beta.R
05_sml_plot.R
06_capm_covariance.R
07_capm_portfolio.R
08_run_project.R

data/
figures/
report/

---

## Methodology

- **Data**: Daily adjusted prices for 20 S&P 500 stocks and the S&P 500 index  
- **Model 1**: Markowitz mean-variance optimization  
- **Model 2**: CAPM-based covariance structure  
- **Performance metric**: Sharpe ratio  
- **Visualization**: Efficient frontier and Security Market Line  

---

## Results

- The Markowitz portfolio achieves a higher Sharpe ratio than the CAPM-based portfolio  
- The CAPM portfolio is more constrained due to its single-factor structure  
- The Efficient Frontier illustrates the trade-off between risk and expected return  
- The SML allows visual identification of potentially under- and over-valued assets  

---

## Visual Results

### Efficient Frontier
![Efficient Frontier](figures/efficient_frontier.png)

### Security Market Line
![SML](figures/sml_plot.png)

---

## Key Insight

The Markowitz portfolio outperforms the CAPM-based portfolio in terms of Sharpe ratio, suggesting that empirical covariance estimation captures diversification opportunities better than the single-factor CAPM structure.

---

## How to Run

```r
source("scripts/08_run_project.R")
```
Author

Abdoul Sarr
