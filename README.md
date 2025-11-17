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

---

## 🚀 How to Run the Test

### 1️⃣ **Run in JMeter GUI**
1. Open **Apache JMeter**
2. File → Open  
3. Select: **JMX/SimpleGrocery_API_LoadTest.jmx**
4. Run → Start (Green Play button)

---

## 2️⃣ **Run in Non-GUI Mode (Recommended for Load Testing)**

### **Windows (.bat)**  
Run inside the project root folder:

