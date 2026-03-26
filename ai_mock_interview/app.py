from flask import Flask, render_template  # pyright: ignore[reportMissingImports]
from routes.interview_routes import interview_bp

app = Flask(__name__)
app.register_blueprint(interview_bp)

@app.route("/")
def home():
    return render_template("interview.html")

@app.route("/result")
def result():
    return render_template("result.html")

if __name__ == "__main__":
    import os
    
    # Get port from environment variable (Railway sets this)
    port = int(os.getenv("PORT", "5000"))
    
    # For Railway deployment, host should be 0.0.0.0
    host = os.getenv("HOST", "0.0.0.0")
    
    # Disable debug mode in production
    debug = os.getenv("DEBUG", "False").lower() == "true"
    
    app.run(debug=debug, host=host, port=port)