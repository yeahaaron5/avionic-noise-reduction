# Avionic Noise Reduction - Filtering Analog Voltage Data

## Project Overview

Modern avionic systems rely on analog voltage signals from sensors such as altimeters to estimate critical flight parameters. These signals are often contaminated with sensor noise, which can obscure meaningful trends and reduce the reliability of downstream computations.

This project focuses on **reducing noise in analog voltage signals derived from simulated altimeter data**. Using time series analysis techniques, we model the temporal structure of the voltage signal and apply statistical filtering to **recover underlying trends while accounting for correlated noise**. The core methodology centers on stationarity transformations, autocorrelation diagnostics, and these type of models: MA(1), GARCH, ARIMA, VAR, and Kalman.

---

## Project Objectives

* Analyze analog voltage time series generated from simulated altimeter data
* Diagnose and address non-stationarity in sensor signals
* Model temporal dependence in noise using ARIMA methods
* Filter sensor noise to better recover useful voltage trends
* Ensure theoretical time series modeling aligns with computational implementation

---

## Data Description

* **Data Source:** Simulated altimeter sensor output
* **Signal Type:** Analog voltage readings
* **Units:** Millivolts (mV)
* **Structure:** Evenly sampled, time-ordered observations
* **Primary Variable:** `Measured_Voltage`

The raw voltage signal exhibits noise and temporal dependence typical of real-world sensor measurements, motivating the use of time series modeling techniques.

---

## Team Roles & Contributions

### Math Lead

* Led statistical modeling and time series theory
* Assessed stationarity of raw voltage signals
* Applied data transformations (first-order differencing) to stabilize the mean
* Conducted ACF and PACF analyses to diagnose temporal dependence
* Selected and interpreted the ARIMA model structure
* Explained ARIMA model components (p, d, q) and selection rationale
* Prepared mathematical slides detailing model formulation and identification logic
* Coordinated with the coding lead to ensure theoretical consistency with implementation
* For the final presentation (as a group):
  - Explained performance differences theoretically
  - Evaluated trade-offs between accuracy and complexity

---

## Methodology Overview

The analysis followed a structured time series workflow:

1. Visual inspection of raw voltage time series
2. Stationarity diagnostics and transformation
3. Autocorrelation and partial autocorrelation analysis
4. ARIMA model identification and selection
5. Model estimation and diagnostics
6. Interpretation of results for noise filtering

---

## Exploratory Time Series Analysis

The raw analog voltage signal was plotted to assess overall behavior. Visual inspection indicated **non-stationary behavior**, including trends that could interfere with reliable modeling and noise characterization.

---

## Stationarity Assessment & Data Transformation

Stationarity is a core requirement for ARIMA modeling.

* **First-order differencing** was applied to remove linear trends and stabilize the mean
* Stationarity was evaluated through visual inspection of the differenced series
* The **Augmented Dickey–Fuller (ADF) test** was used to statistically confirm stationarity after transformation

These steps ensured the transformed signal satisfied the assumptions required for ARIMA modeling.

---

## Autocorrelation Analysis (ACF & PACF)

To identify the appropriate ARIMA structure, autocorrelation diagnostics were conducted on the differenced voltage series:

* **ACF (Autocorrelation Function):** Used to assess overall temporal dependence and moving-average behavior
* **PACF (Partial Autocorrelation Function):** Used to diagnose potential autoregressive structure

The observed patterns informed the selection of AR and MA orders for the final model.

---

## ARIMA Model Selection

Based on stationarity diagnostics and ACF/PACF analysis, an **ARIMA(0,1,1)** model was selected.

### Model Interpretation

* **d = 1:** First-order differencing removes non-stationary trend components
* **p = 0:** No significant autoregressive structure detected
* **q = 1:** A single moving-average term captures short-term shock effects in sensor noise

This configuration effectively models correlated noise while preserving underlying voltage trends.

---

## Model Formulation

The selected ARIMA(0,1,1) model can be expressed as:

[
(1 - B)$y_t$ = (1 + $\theta_1$ B)$\varepsilon_t$
]

where:

* (B) is the backshift operator
* ($y_t$) represents the measured voltage at time (t)
* ($\varepsilon_t$) is white noise

The differencing operator removes trend, while the moving-average term models transient sensor noise effects.

---

## Model Implementation

* Implemented in **R** using time series and statistical modeling libraries
* ARIMA estimation performed with differencing specified directly in the model
* Theoretical model parameters were cross-validated against the computational implementation to ensure consistency

---

## Model Diagnostics

Model adequacy was evaluated using residual diagnostics:

* **Ljung–Box tests** applied at multiple lags (e.g., 10 and 20)
* Residuals exhibited behavior consistent with white noise
* Diagnostic results support the adequacy of the selected ARIMA model

---

## Results & Interpretation

* The ARIMA model successfully captured temporal dependence in the noisy voltage signal
* Residual diagnostics indicate effective noise modeling
* Filtering the signal improves recovery of meaningful voltage trends from simulated altimeter data

These results demonstrate the usefulness of ARIMA-based filtering for avionic sensor noise reduction.

---

## How to Run

1. Ensure R is installed
2. Install required packages:

   * `tseries`
   * `astsa`
3. Run `STAT626_Project.R` to reproduce the analysis

---

## Presentation
A summary of the project’s methodology, results, and conclusions
is available in the final presentation:

- [`avionic-noise-reduction-slides.pdf`](Presentation/avionic-noise-reduction-slides.pdf)

---

## Acknowledgments

This project was completed as a collaborative group effort, integrating statistical theory and computational implementation to address sensor noise in avionic systems.
