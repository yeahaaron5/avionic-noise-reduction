# Project
# Reading in the CSV file
voltage_data <- read.csv("voltage_readings.csv")
# Setting the measured voltage as our data
measured_voltage <- voltage_data$Measured_Voltage
ts.plot(measured_voltage, main = "Time Series of Measured Voltage", ylab = "Voltage (mV)")

# Performing a first order difference to eliminate linear trend from the original data'
diff_measured_voltage <- diff(measured_voltage)
ts.plot(diff_measured_voltage, main = "First Order Difference of Measured Voltage", ylab = "Voltage (mV)")

# Visually checking for stationarity for the first order differenced data
par(mfrow = c(2, 1))

acf(diff_measured_voltage)
title(main = "ACF: First Order Difference of Meausred Voltage")
pacf(diff_measured_voltage)
title(main = "PACF: First Order Difference of Meausred Voltage")

# Statistically checking for stationarity now
adf.test(diff_measured_voltage) # Augmented Dickey-Fuller Test

# Using an ARIMA(0,1,1) model to identify dependence orders 
fit <- sarima(measured_voltage, p = 0, d = 1, q = 1)

# Statistically checking for white noise residuals
res <- fit$fit$residuals
Box.test(res, lag = 10, type = "Ljung-Box")
Box.test(res, lag = 20, type = "Ljung-Box")
