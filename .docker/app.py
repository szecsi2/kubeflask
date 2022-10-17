from flask import Flask
import os

#import subprocess
#//Only work locally
#def get_git_revision_short_hash() -> str:
#    return subprocess.check_output(['git', 'rev-parse', '--short', 'HEAD']).decode('ascii').strip()

app = Flask(__name__)

@app.route("/")
def home():
    return "KubeFlask App"
    
@app.route("/healthz")
def health():
    return "ok"

@app.route("/alert")
def alert():
    return "increment the counter in redis"

@app.route("/counter")
def counter():
    return "print the value of the counter"

@app.route("/version")
def version():
    #Only work locally
    #return get_git_revision_short_hash() 
    return os.environ.get("GIT_SHA")
if __name__ == "__main__":
    app.run(debug=True)
