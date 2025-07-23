""" import os
from flask import Flask
import redis

app = Flask(__name__)
host_redis = os.getenv('REDIS_HOST', 'redis')
port_redis = int(os.getenv('REDIS_PORT', 6379))
r = redis.Redis(host=host_redis, port=port_redis)

@app.route('/')
def hello_world():
    return 'We are running our first container - from CoderCo'

@app.route('/count')
def count():
    count = r.incr('visitor_count')
    return f'You are Visitor number: {count}'

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5002)
"""
import os
import random
from flask import Flask, jsonify, render_template_string, url_for
import redis

app = Flask(__name__)
host_redis = os.getenv('REDIS_HOST', 'redis')
port_redis = int(os.getenv('REDIS_PORT', 6379))
r = redis.Redis(host=host_redis, port=port_redis)

# Sample coordinates for random locations (lat, lng)
LOCATIONS = [
    (51.5074, -0.1278),    # London
    (40.7128, -74.0060),   # New York
    (35.6895, 139.6917),   # Tokyo
    (48.8566, 2.3522),     # Paris
    (55.7558, 37.6173),    # Moscow
    (-33.8688, 151.2093),  # Sydney
    (19.4326, -99.1332),   # Mexico City
    (52.5200, 13.4050),    # Berlin
    (34.0522, -118.2437),  # Los Angeles
]

@app.route('/')
def home():
    html_content = '''
    <!DOCTYPE html>
    <html>
    <head>
        <title>Welcome to the Visitor Counter</title>
        <style>
            @import url('https://fonts.googleapis.com/css2?family=Pacifico&family=Poppins:wght@300;400;600&display=swap');
            body { font-family: 'Poppins', sans-serif; text-align: center; background-color: #e0f7fa; color: #333; padding: 20px; }
            h1 { font-family: 'Pacifico', cursive; font-size: 3em; }
            .about-box { background: #ffffff; padding: 20px; margin: 20px auto; width: 60%; border-radius: 12px; box-shadow: 0 4px 8px rgba(0,0,0,0.2); transition: transform 0.3s ease; }
            .about-box:hover { transform: scale(1.05); }
            a { text-decoration: none; color: #007BFF; font-weight: 600; }
            a:hover { text-decoration: underline; }
            #globe-container { background: url('https://i.pinimg.com/564x/73/fb/66/73fb66aa69f9ce8bdc923d3a30237959.jpg') no-repeat center center/contain; width: 300px; height: 300px; margin: 20px auto; }
            .icon-links img { width: 30px; margin: 0 10px; vertical-align: middle; }
        </style>
    </head>
    <body>
        <h1>Welcome to My Visitor Counter Page</h1>

        <div id="globe-container"></div>

        <p><a href="/count">Click here to see the latest visitor count and random visitor popup</a></p>

        <div class="about-box">
            <h2>About This Application</h2>
            <p>This application is built to test my ability in creating a <strong>multi-container application using Docker</strong>. It uses:</p>
            <ul>
                <li>Redis for count storage</li>
                <li>Flask as the web server</li>
                <li>Nginx for load distribution</li>
            </ul>
            <p>Connect with me:</p>
            <div class="icon-links">
                <a href="https://github.com/maaclin" target="_blank">
                    <img src="https://cdn-icons-png.flaticon.com/512/25/25231.png" alt="GitHub">
                </a>
                <a href="https://www.linkedin.com/in/yossief-s/" target="_blank">
                    <img src="https://cdn-icons-png.flaticon.com/512/174/174857.png" alt="LinkedIn">
                </a>
            </div>
            <p>If you want to know how this works under the hood, check out my <a href="https://github.com/maaclin/DevOps/tree/main/DOCKER/projects/project_flask-redis" target="_blank">README here</a>.</p>
        </div>
    </body>
    </html>
    '''
    return render_template_string(html_content)

@app.route('/count')
def count_page():
    html_content = '''
    <!DOCTYPE html>
    <html>
    <head>
        <title>Visitor Counter</title>
        <style>
            @import url('https://fonts.googleapis.com/css2?family=Pacifico&family=Poppins:wght@300;400;600&display=swap');
            body { font-family: 'Poppins', sans-serif; text-align: center; background-color: #e0f7fa; color: #333; margin: 0; padding: 20px; }
            #counter { font-size: 2em; margin: 20px; animation: fadeIn 1s ease-in-out; }
            @keyframes fadeIn { from {opacity: 0;} to {opacity: 1;} }
            .popup { display: inline-block; background: #fff; color: #333; padding: 10px 14px; border-radius: 10px; box-shadow: 0 2px 6px rgba(0,0,0,0.3); margin-top: 20px; animation: fadeIn 0.5s ease-in-out; }
        </style>
    </head>
    <body>
        <h1>🌍 Visitor Counter 🌍</h1>
        <div id="counter">Loading visitor count...</div>
        <div id="popup"></div>

        <script>
            async function updateCounter() {
                const response = await fetch('/count-data');
                const data = await response.json();
                document.getElementById('counter').innerText = `You are Visitor number: ${data.count}`;
                document.getElementById('popup').innerText = `New visitor from: Latitude ${data.location.lat}, Longitude ${data.location.lng}`;
            }
            updateCounter();
        </script>
    </body>
    </html>
    '''
    return render_template_string(html_content)

@app.route('/count-data')
def count_data():
    count = r.incr('visitor_count')
    location = random.choice(LOCATIONS)
    return jsonify({
        'count': count,
        'location': {'lat': location[0], 'lng': location[1]}
    })

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5002)

