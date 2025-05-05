# 🎬 YT-Downloader Flask Server

A lightweight Flask-based local server to download YouTube videos by URL — with a Tampermonkey integration for one-click downloads directly from YouTube.

![screenshot](https://github.com/user-attachments/assets/d187dede-8c97-4cda-8ef6-6a0bb49a1cc8)

---

## 🚀 Features

- 📥 Download YouTube videos in high resolution using `pytubefix`
- 🌐 Simple Flask API: `GET /download?url=...`
- 💻 Compatible with Windows, Linux, macOS
- 🧠 Tampermonkey script adds a native-style "Download" button to YouTube
- 🗂️ Fully portable — no dependencies are system-wide

---

## ⚙️ Installation & Usage

### 🔧 1. Clone the repository

```bash
git clone https://github.com/Kelimm/yt-server
cd yt-server
```

### 💻 2. Set up the environment and run the server

#### ✅ Option A – Automatic setup

Use the provided script depending on your OS:

**On Windows:**
```cmd
setup.bat Run as administrator
```

**On Linux/macOS:**
```bash
chmod +x setup.sh
./setup.sh
```

These scripts will:
- Create a Python virtual environment (`myenv/`) if not already present
- Install dependencies from `requirements.txt`
- Launch the Flask server at `http://localhost:5000`

#### ✅ Option B – Manual setup

```bash
python -m venv myenv
source myenv/bin/activate      # or myenv\Scripts\activate.bat on Windows
pip install -r requirements.txt
python serveur.py
```

---

### 🧩 3. Install the Tampermonkey YouTube integration (optional)

1. Install the **Tampermonkey** extension in your browser (Chrome, Firefox, Edge, etc.)
2. Open the extension and click *“Create a new script”*
3. Copy and paste the code from the `monkey-script` file in this repository
4. Save the script and enable it
5. Visit any YouTube video page
6. A **"Télécharger"** button will appear near the video — click it to send the video to your local Flask server for download

---

## 📌 Notes

- Download folder:
  - Windows: `C:\Users\<YourUsername>\Downloads\YT_Downloads`
  - Linux/macOS: `/home/<your_user>/Downloads/YT_Downloads`
- This is a **local tool** — your server is not exposed to the internet unless you configure it otherwise.

---

## 📄 License

This project is licensed under the MIT License — feel free to use, modify, and share.

---
