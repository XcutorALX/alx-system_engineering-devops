#!/usr/bin/python3
import requests

r = requests.get("http://18.204.15.22")
print(r.headers)
