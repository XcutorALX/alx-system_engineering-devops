#!/usr/bin/python3
"""
This module contains a
number_of_subscribers function
"""

import requests


def number_of_subscribers(subreddit):
    """
    a function that queries the Reddit API
    and returns the number of subscribers
    """
    url = "https://api.reddit.com/r/{}/about/".format(str(subreddit))
    u_agent = {'User-Agent': '/u/Suspicious-Jelly920'}
    result = requests.get(url, headers=u_agent)
    if result.status_code == 200:
        return (result.json()['data']['subscribers'])
    return (0)
