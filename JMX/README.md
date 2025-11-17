# Simple Grocery Store API – Performance Test Suite (JMeter)

This project contains JMeter performance test scripts for the 
Simple Grocery Store API:  
https://simple-grocery-store-api.click/

---

## 📁 Project Structure

- **JMX/** → Contains JMeter test scripts  
- **Data/** → CSV files used for data-driven testing  
- **Reports/** → Output folder for HTML / JTL reports  
- **Documentation/** → Test Plan, scenarios, metrics  
- **Scripts/** → Helper scripts for running non-GUI tests  

---

## 🧪 Test Details

**Test Name:** SimpleGrocery_API_LoadTest  
**Purpose:**  
- Validate stability & correctness of all key endpoints  
- Measure response times & throughput  
- Validate cart creation → add item → client registration flow  

**Load Profile:**  
- **Users:** 10  
- **Ramp-up:** 20 seconds  
- **Loop Count:** 1  

**Test Coverage:**
- `/status` endpoint health check
- `/products` endpoint (with query parameters)
- `/products/{productId}` for individual product details
- `POST /carts` for cart creation
- `POST /api-clients` for client registration

---

## 🚀 How to Run the Test

### 1️⃣ **Run in JMeter GUI**
1. Open **Apache JMeter**
2. File → Open  
3. Select: **JMX/SimpleGrocery_API_LoadTest.jmx**
4. Verify CSV Data Set Config points to **../Data/product_ids.csv**
5. For debugging, set Thread Group → Number of Threads = 1 and Loop Count = 1
6. Run → Start (Green Play button)
7. View results in:
   - **View Results Tree** (for debugging)
   - **Summary Report** (for aggregated metrics)

**Notes:**
- Disable View Results Tree for large runs (high memory usage)
- Use GUI mode only for debugging and script development

---

## 2️⃣ **Run in Non-GUI Mode (Recommended for Load Testing)**

### **Windows (.bat)**  
Navigate to the `Scripts` folder and run:
```batch
cd Scripts
run_jmeter_non_gui.bat
```

**Before running, update JMETER_HOME in the script:**
- Open `Scripts\run_jmeter_non_gui.bat`
- Update line 6: `SET JMETER_HOME=C:\apache-jmeter`
- Change to your JMeter installation path

### **Linux/Mac (.sh)**
Navigate to the `Scripts` folder and run:
```bash
cd Scripts
chmod +x run_jmeter_non_gui.sh
./run_jmeter_non_gui.sh
```

**Before running, update JMETER_HOME in the script:**
- Open `Scripts/run_jmeter_non_gui.sh`
- Update line 5: `JMETER_HOME="/opt/apache-jmeter"`
- Change to your JMeter installation path

### **Manual Non-GUI Execution**
You can also run JMeter manually from command line:
```bash
jmeter -n -t JMX/SimpleGrocery_API_LoadTest.jmx -l Reports/JTL_Files/results.jtl -e -o Reports/HTML_Reports/report_001
```

**Command Options:**
- `-n` : Non-GUI mode
- `-t` : Path to test plan (JMX file)
- `-l` : Results file (JTL format)
- `-e` : Generate dashboard report
- `-o` : Output folder for HTML report (must not exist)

---

## 📊 Reports

After running tests in non-GUI mode, reports will be generated in:
- **HTML Reports:** `Reports/HTML_Reports/` - Interactive dashboard with graphs
- **JTL Files:** `Reports/JTL_Files/` - Raw test results data
- **Summary Logs:** `Reports/Summary_Reports/` - JMeter execution logs

---

## 🔧 Troubleshooting

### 1. XML load errors on opening JMX:
   - Ensure the file is saved as UTF-8 **without BOM**
   - No blank lines or characters before the first `<?xml` line
   - Replace invalid XML comments (use `<!-- comment -->`)

### 2. Assertion failures:
   - For HTTP status assertions use **Response Code**
   - For body checks use **Response Data**
   - Use "Substring" or JSON Assertion for exact JSON checks
   - Avoid unescaped regex tokens like `[`

### 3. CSV issues:
   - Ensure CSV files exist in `Data/` folder
   - In CSV Data Set Config, check "Recycle on EOF" (true) and "Stop thread on EOF" (false)
   - Verify file paths are relative: `../Data/product_ids.csv`

### 4. Product-by-id returns 404:
   - ID not present in dataset
   - Update `Data/product_ids.csv` with valid IDs from `GET /products`

### 5. Script execution fails:
   - Verify JMETER_HOME path is correct in the script
   - Ensure JMeter bin directory contains `jmeter.bat` or `jmeter.sh`
   - Check that all CSV files are present in the `Data/` folder

---

## 🚀 Next Steps (Optional Enhancements)

- Add JSON Extractor after `POST /api-clients` to capture access token for authenticated endpoints
- Replace substring assertions with JSON Assertion for more robust checks
- Add timers / throughput controllers for more realistic load shape
- Add more POST/PATCH/PUT flows to test cart and order workflows end-to-end
- Implement parameterized load profiles for different test scenarios
- Add custom listeners for real-time monitoring

---

## 📚 Additional Documentation

Refer to the `Documentation/` folder for:
- **Performance_Test_Plan.docx** - Detailed test planning document
- **Performance_Scenarios.md** - Test scenario definitions
- **SLAs_and_Metrics.md** - Performance targets and KPIs

---

## 📝 Notes

- **Authentication:** For testing authenticated endpoints (orders), register an API client first and extract the token using a JSON Extractor, then add an HTTP Header Manager with `Authorization: Bearer ${accessToken}`
- **Best Practices:** Disable View Results Tree for large runs to reduce memory usage
- **CSV Data:** The `Data/` folder contains data files used for parameterization
