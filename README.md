# From Theory to Practice: Comparing Markowitz and CAPM for Real-World Portfolio Construction

A quantitative investment analysis comparing the classic Markowitz Mean-Variance framework against a CAPM-based factor approach, highlighting the trade-off between performance and portfolio stability.

![Efficient Frontier](figures/efficient_frontier.png)

---

## The Problem: Why Do Optimized Portfolios Fail in Practice?

Every finance student learns Markowitz's Mean-Variance Optimization. However, when applied to real data, a major issue emerges:

> **Optimized portfolios are extremely sensitive to input estimates.**

Small changes in expected returns or covariance matrices can lead to unstable and impractical allocations (e.g., extreme long and short positions).

The Capital Asset Pricing Model (CAPM) offers an alternative by imposing a structured, factor-based covariance model.

This project investigates:

1. How different are Markowitz and CAPM portfolios?
2. Which model delivers higher risk-adjusted performance?
3. Which approach is more practical to implement?

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
=======
## Key Findings

| Metric               | Markowitz (Empirical) | CAPM (Factor-Based) | Interpretation                        |
| -------------------- | --------------------- | ------------------- | ------------------------------------- |
| **Sharpe Ratio**     | 0.0860                | 0.0286              | Markowitz achieves higher performance |
| **Volatility**       | 3.26%                 | 1.28%               | CAPM is more stable                   |
| **Short Positions**  | Present               | None                | CAPM is easier to implement           |
| **Weight Stability** | Very unstable         | Stable              | CAPM reduces estimation noise         |

**Main Insight:**
Markowitz maximizes performance but produces unstable portfolios.
CAPM sacrifices performance to achieve robustness and implementability.
>>>>>>> fd2cde3 (Final clean CAPM vs Markowitz README)

---

## Methodology

### Framework Overview

```text
Stock Prices (S&P 500 constituents + index)
↓
Daily Log Returns
↓
        ┌────────────┴────────────┐
        ↓                         ↓
  Markowitz Model           CAPM Model
        ↓                         ↓
 Empirical μ, Σ          β estimation (OLS)
        ↓                         ↓
 Tangent Portfolio       Σ_CAPM = σ²_m (ββᵀ) + D_ε
        ↓                         ↓
 Compare: Returns, Risk, Weights
```

---

### Model 1: Markowitz Mean-Variance

* Uses empirical mean returns and covariance matrix
* Maximizes Sharpe ratio
* Allows short selling
* Highly sensitive to estimation error

---

### Model 2: CAPM-Based Approach

* Estimates β via regression on market returns
* Constructs covariance matrix using a single-factor structure
* Expected returns derived from CAPM
* Produces more stable and diversified portfolios

**Important:**
CAPM reduces noise but may ignore asset-specific relationships.

---

### Risk-Free Rate

Daily approximation:

[
r_f = \frac{0.02}{252}
]

---

## Results

### Efficient Frontier

![Efficient Frontier](figures/efficient_frontier.png)

The Markowitz portfolio achieves higher expected return at the cost of higher volatility.

---

### Security Market Line (SML)

![SML](figures/sml_plot.png)

The SML represents the theoretical relationship between β and expected return.

* Points above the line: potential outperformance
* Points below the line: underperformance

---

### Portfolio Weights

**Markowitz Portfolio:**

* Large positive and negative positions
* Extreme sensitivity to inputs

**CAPM Portfolio:**

* All long positions
* Well diversified
* More realistic allocations

---

### Covariance Structure

| Markowitz                  | CAPM                    |
| -------------------------- | ----------------------- |
| Noisy and unstable         | Structured and smooth   |
| Captures full correlations | Driven by market factor |
| High estimation error      | More robust             |

---

## Key Insights

* Portfolio optimization is highly sensitive to input estimation
* Markowitz extracts maximum information but lacks stability
* CAPM improves robustness through structural assumptions
* There is a fundamental trade-off between performance and stability
* Factor models help reduce estimation error in practice

---

## Technical Implementation

* Language: R
* Libraries: quantmod, ggplot2, mvtnorm, ellipse
* Methods:

  * Mean-variance optimization
  * OLS regression (β estimation)
  * Matrix algebra for covariance construction
  * Sharpe ratio comparison

---

## Reproducibility

Run the full project:

<<<<<<< HEAD
    source("scripts/08_run_project.R")

---

## Author

**Abdoul Sarr**
=======
```r
source("scripts/08_run_project.R")
```

All figures and results are generated automatically.

---

## Project Structure

```text
.
├── README.md
├── data/              # Raw data (gitignored)
├── figures/
│   ├── efficient_frontier.png
│   └── sml_plot.png
└── scripts/
    ├── 01_download_data.R
    ├── 02_prepare_returns.R
    ├── 03_markowitz.R
    ├── 04_capm_beta.R
    ├── 05_sml_plot.R
    ├── 06_capm_covariance.R
    ├── 07_capm_portfolio.R
    └── 08_run_project.R
```

---

## Conclusion

This project illustrates a core challenge in quantitative finance:

* Markowitz optimization provides higher performance but is unstable
* CAPM introduces structure that improves stability and interpretability

Neither model is universally superior. The appropriate choice depends on constraints such as:

* ability to short sell
* tolerance for estimation error
* implementation feasibility

---

## Extensions

Potential improvements include:

* Black-Litterman model
* Robust portfolio optimization
* Covariance shrinkage (Ledoit-Wolf)
* Out-of-sample backtesting
* Transaction cost modeling

---
