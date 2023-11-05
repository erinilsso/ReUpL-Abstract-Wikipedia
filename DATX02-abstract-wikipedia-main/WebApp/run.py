from http.server import BaseHTTPRequestHandler, HTTPServer
import time
import sys
import os
from urllib.parse import unquote
from dotenv import load_dotenv
from geopy.distance import lonlat

load_dotenv()
gf_path = os.getenv("AW_GF")
python_path = os.getenv("AW_PYTHON")
query_data_path = os.getenv("AW_QUERY_DATA")
data_path = os.getenv("AW_DATA")
geoapify_key = os.getenv("GEOAPIFY_KEY")

dir_path = os.path.dirname(os.path.realpath(__file__))

# Required to access stage3.py
sys.path.append(python_path)
import stage3 as B
import weather as W

hostname = "localhost"
port     = 8080

template = "Default."
boroughs_all = []

class MyServer(BaseHTTPRequestHandler):

    # Handles GET requests
    def do_GET(self):
        self.send_response(200)
        self.send_header("Content-Type", "text/html; charset=utf-8")
        self.end_headers()
        doc = template
        
        borough = None
        if(len(self.path) > 1):
            borough = unquote(self.path[1:])

        # Title
        if borough:
            doc = doc.replace("{{title}}", borough)
        else:
            doc = doc.replace("{{title}}", "Boroughs", 1)
            doc = doc.replace("{{title}}", "Please choose a borough")

        # Body
        body = None
        (facts, meta) = get_facts(borough)

        if facts:
            body = "\n".join([ "<p>%s</p>" % f for f in facts ])
        if(body):
            doc = doc.replace("{{body}}", body)
        else:
            doc = doc.replace("{{body}}", "")

        # Image
        if meta and len(meta) > 0:
            tag = "<img src='" + meta[0] + "' alt='Image over " + borough + "'>"
            doc = doc.replace("{{img}}", tag)
        else:
            doc = doc.replace("{{img}}","")

        img = None

        # Map
        if meta and len(meta) > 0:
            tmp_str = meta[1].split(" ")
            (lon, lat) = (float(tmp_str[0][6:]), float(tmp_str[1][:-1]) )
            img = W.get_weather(lon,lat,borough)

            #lon = lonlat(lat, lon).longitude
            #lat = lonlat(lat, lon).latitude
            url = f"https://maps.geoapify.com/v1/staticmap?style=osm-carto&width=600&height=400&center=lonlat:{lon},{lat}&zoom=5&marker=lonlat:{lon},{lat};color:%23ff0000;size:medium&apiKey={geoapify_key}"
            tag = "<br><img src='" + url + "' alt='Image over " + borough + "'>"
            doc = doc.replace("{{map}}", tag)
        else:
            doc = doc.replace("{{map}}","")

        if img:
            tag = "<br><img src='data:image/png;base64, " + str(img)[2:-1] + "' alt='weather data'>"
            doc = doc.replace("{{weather}}",tag)
        else:
            doc = doc.replace("{{weather}}","")
        # Selections
        if(len(boroughs_all) > 0):
            options = ["<option value='%s' />" % b for b in boroughs_all ]
            doc = doc.replace("{{borough_options}}", "\n".join(options))
        else:
            doc = doc.replace("{{borough_options}}", "")

        self.wfile.write(bytes(doc, "utf-8"))
    

def get_facts(borough):
    if not borough:
        return (None, None)
    #cwd = os.getcwd()
    #print("CWD: ", cwd)
    #os.chdir("../Boroughs/python")

    try:
        index = boroughs_all.index(borough)
        fact, meta = B.get_one_fact(index)
    except ValueError:
        fact = ["Error."]
        meta = []

    #os.chdir(cwd)
    return (fact, meta)

def read_boroughs(path):
    f = open(path)
    content = f.readlines()
    content = [ c[:-1] for c in content]
    f.close()
    return content

def read_template(path):
    f = open(path)
    content = f.read()
    f.close()
    return content

def main():
    global template 
    global boroughs_all

    template = read_template(dir_path + "/template.html")
    boroughs_all = read_boroughs(data_path + "boroughs.txt")

    webserver = HTTPServer((hostname, port), MyServer)
    print("Server listening at http://%s:%s" % (hostname, port))

    try:
        webserver.serve_forever()
    except KeyboardInterrupt:
        pass

    webserver.server_close()
    print("Server stopped.")

if __name__ == "__main__":
    main()