@echo off
REM JMeter Non-GUI Execution Script for Windows
REM This script runs JMeter in non-GUI mode for performance testing

REM Set JMeter home directory (update this path to your JMeter installation)
SET JMETER_HOME=C:\apache-jmeter

REM Set test parameters
SET JMX_FILE=..\JMX\SimpleGrocery_API_LoadTest.jmx
SET JTL_FILE=..\Reports\JTL_Files\results_%date:~-4,4%%date:~-10,2%%date:~-7,2%_%time:~0,2%%time:~3,2%%time:~6,2%.jtl
SET HTML_REPORT_DIR=..\Reports\HTML_Reports\report_%date:~-4,4%%date:~-10,2%%date:~-7,2%_%time:~0,2%%time:~3,2%%time:~6,2%
SET LOG_FILE=..\Reports\Summary_Reports\jmeter_%date:~-4,4%%date:~-10,2%%date:~-7,2%_%time:~0,2%%time:~3,2%%time:~6,2%.log

REM Clean timestamp variables (remove spaces)
SET JTL_FILE=%JTL_FILE: =0%
SET HTML_REPORT_DIR=%HTML_REPORT_DIR: =0%
SET LOG_FILE=%LOG_FILE: =0%

echo ====================================
echo JMeter Non-GUI Load Test Execution
echo ====================================
echo Test File: %JMX_FILE%
echo Results File: %JTL_FILE%
echo HTML Report: %HTML_REPORT_DIR%
echo Log File: %LOG_FILE%
echo ====================================

REM Run JMeter in non-GUI mode
"%JMETER_HOME%\bin\jmeter.bat" -n -t %JMX_FILE% -l %JTL_FILE% -e -o %HTML_REPORT_DIR% -j %LOG_FILE%

echo ====================================
echo Test execution completed!
echo HTML Report generated at: %HTML_REPORT_DIR%
echo ====================================

pause
