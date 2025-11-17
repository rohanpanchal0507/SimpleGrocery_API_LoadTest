#!/bin/bash
# JMeter Non-GUI Execution Script for Linux/Mac
# This script runs JMeter in non-GUI mode for performance testing

# Set JMeter home directory (update this path to your JMeter installation)
JMETER_HOME="/opt/apache-jmeter"

# Set test parameters
JMX_FILE="../JMX/SimpleGrocery_API_LoadTest.jmx"
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
JTL_FILE="../Reports/JTL_Files/results_${TIMESTAMP}.jtl"
HTML_REPORT_DIR="../Reports/HTML_Reports/report_${TIMESTAMP}"
LOG_FILE="../Reports/Summary_Reports/jmeter_${TIMESTAMP}.log"

echo "===================================="
echo "JMeter Non-GUI Load Test Execution"
echo "===================================="
echo "Test File: $JMX_FILE"
echo "Results File: $JTL_FILE"
echo "HTML Report: $HTML_REPORT_DIR"
echo "Log File: $LOG_FILE"
echo "===================================="

# Run JMeter in non-GUI mode
"$JMETER_HOME/bin/jmeter.sh" -n -t "$JMX_FILE" -l "$JTL_FILE" -e -o "$HTML_REPORT_DIR" -j "$LOG_FILE"

echo "===================================="
echo "Test execution completed!"
echo "HTML Report generated at: $HTML_REPORT_DIR"
echo "===================================="
