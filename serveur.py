from flask import Flask, request
from flask_cors import CORS
from pytubefix import YouTube
import os 
import platform

app = Flask(__name__)
if platform.system() == "Windows":
    DIR = os.path.join(os.environ["USERPROFILE"], "Downloads", "YT_Downloads")
else: 
    DIR = os.path.join(os.environ["HOME"], "Downloads", "YT_Downloads")

CORS(app)

@app.route('/')
def home() :
    print("Serveur YT actif")
    return 'Serveur YT actif'
@app.route('/download')
def download():
    if not os.path.isdir(DIR) :
        os.makedirs(DIR)
    url = request.args.get("url")
    if not url:
        return 'URL manquante', 400
    try:
        yt = YouTube(url)
        ys = yt.streams.get_highest_resolution()
        ys.download(output_path=DIR)

        return f"Téléchargement terminé : {yt.title}", 200  # ✅ important
    except Exception as e: 
        print(str(e))
        return str(e)
if __name__ == "__main__" :
    app.run(host='0.0.0.0', port=5000)