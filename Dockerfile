FROM python:3.9-slim

WORKDIR /app

# Create a stylish Dragon themed web page
RUN echo '\
from http.server import HTTPServer, BaseHTTPRequestHandler\n\
\n\
HTML_CONTENT = """<!DOCTYPE html>\n\
<html lang="en">\n\
<head>\n\
    <meta charset="UTF-8">\n\
    <meta name="viewport" content="width=device-width, initial-scale=1.0">\n\
    <title>Ashroof DevOps</title>\n\
    <style>\n\
        * { margin: 0; padding: 0; box-sizing: border-box; }\n\
        body {\n\
            font-family: "Segoe UI", Roboto, Helvetica, Arial, sans-serif;\n\
            background: radial-gradient(circle, #1a1a1a 0%, #000000 100%);\n\
            min-height: 100vh;\n\
            display: flex;\n\
            justify-content: center;\n\
            align-items: center;\n\
            color: #D4AF37;\n\
        }\n\
        .container {\n\
            background: rgba(20, 20, 20, 0.8);\n\
            border: 2px solid #D4AF37;\n\
            border-radius: 15px;\n\
            padding: 50px;\n\
            text-align: center;\n\
            box-shadow: 0 0 30px rgba(212, 175, 55, 0.3);\n\
            max-width: 500px;\n\
            position: relative;\n\
        }\n\
        .dragon-icon {\n\
            font-size: 80px;\n\
            margin-bottom: 20px;\n\
            filter: drop-shadow(0 0 10px #D4AF37);\n\
            display: inline-block;\n\
            animation: float 3s ease-in-out infinite;\n\
        }\n\
        @keyframes float {\n\
            0%, 100% { transform: translateY(0) rotate(0deg); }\n\
            50% { transform: translateY(-15px) rotate(5deg); }\n\
        }\n\
        h1 {\n\
            font-size: 2.5rem;\n\
            text-transform: uppercase;\n\
            letter-spacing: 5px;\n\
            margin-bottom: 15px;\n\
            color: #D4AF37;\n\
            text-shadow: 0 0 15px rgba(212, 175, 55, 0.5);\n\
        }\n\
        p {\n\
            color: #ffffff;\n\
            font-size: 1.1rem;\n\
            margin-bottom: 25px;\n\
            opacity: 0.8;\n\
        }\n\
        .badge {\n\
            background: #D4AF37;\n\
            color: #000;\n\
            padding: 8px 20px;\n\
            border-radius: 4px;\n\
            font-weight: bold;\n\
            text-transform: uppercase;\n\
            font-size: 0.8rem;\n\
        }\n\
        .footer {\n\
            margin-top: 30px;\n\
            font-size: 0.8rem;\n\
            color: #666;\n\
        }\n\
    </style>\n\
</head>\n\
<body>\n\
    <div class="container">\n\
        <div class="dragon-icon">🐉</div>\n\
        <h1>Ashroof</h1>\n\
        <p>The Dragon Awakens in the Cloud</p>\n\
        <div class="badge">Infrastucture Secured</div>\n\
        <div class="footer">Built with Docker & Python</div>\n\
    </div>\n\
</body>\n\
</html>"""\n\
\n\
class SimpleHTTPRequestHandler(BaseHTTPRequestHandler):\n\
    def do_GET(self):\n\
        self.send_response(200)\n\
        self.send_header("Content-type", "text/html")\n\
        self.end_headers()\n\
        self.wfile.write(HTML_CONTENT.encode())\n\
\n\
httpd = HTTPServer(("0.0.0.0", 8080), SimpleHTTPRequestHandler)\n\
httpd.serve_forever()\n\
' > app.py

EXPOSE 8080

CMD ["python", "app.py"]