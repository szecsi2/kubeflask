from flask import Flask

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
    return "git commit hash"
 

if __name__ == "__main__":
    app.run(debug=True)
