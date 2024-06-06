#!/usr/bin/python3
"""
a function that queries the Reddit API 
and returns the number of subscribers
"""

import requests


def number_of_subscribers(subreddit):
    url = "https://api.reddit.com/r/{}/about".format(str(subreddit))
    result = requests.get(url)
    if result.status_code == 200:
        return (result.json()['data']['subscribers'])
    return (0)
