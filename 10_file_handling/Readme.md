# 10 – File Handling in ABAP

## 🎯 What you will learn
This topic covers reading and writing files in ABAP.

You will learn:
- Upload file from presentation server (frontend PC)
- Download internal table to local file
- Using GUI_UPLOAD and GUI_DOWNLOAD
- Basic validation and error handling
- Working with STRING and ASCII formats

## 🧩 Keywords
GUI_UPLOAD, GUI_DOWNLOAD, DATASET, OPEN DATASET, CSV, text file

## 🛠 Transactions Used
- SE38 / SE80 – ABAP Editor
- AL11 – view application server directory paths
- CG3Y / CG3Z – alternate upload and download options (optional)

## 📄 Programs Included
- z_upload_from_presentation_server.abap
- z_download_to_presentation_server.abap

## ✍️ Explanation (short & simple)
Files in ABAP can be handled in two ways:

1. **Presentation Server (Frontend PC)**
   – uses GUI_UPLOAD / GUI_DOWNLOAD  
   – reads & writes local Excel/CSV/TXT files

2. **Application Server**
   – uses OPEN DATASET / READ DATASET / TRANSFER  
   – files stored on SAP server directories

In this section we focus on **presentation server file handling** because it is most commonly used in real projects.

## 🧭 Try it yourself
1. Change separator from TAB to COMMA when downloading  
2. Upload CSV and split it using `SPLIT AT ','`  
3. Handle empty lines when reading file  
4. Validate file path before upload  

## 🔍 Notes
- GUI_UPLOAD/GUI_DOWNLOAD require SAP GUI (not Fiori)
- Prefer application server for background jobs
- Always validate `sy-subrc`
- Handle encoding correctly for Unicode systems
