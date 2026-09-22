#!/usr/bin/env python3

import json
import os

import requests


GHUSER = os.getenv("GITHUB_USER")
url = f"https://api.github.com/users/{GHUSER}/events"


def retrieve_events(url):
    """Download GitHub events from a URL and return the decoded JSON data."""
    response_text = requests.get(url).text
    return json.loads(response_text)


def print_events(events, n=5):
    """Print the type and repository name for the first n GitHub events."""
    for item in events[:n]:
        event = item["type"] + " :: " + item["repo"]["name"]
        print(event)


def main():
    """Retrieve and display recent GitHub activity for GITHUB_USER."""
    print(GHUSER)
    print(url)
    events = retrieve_events(url)
    print_events(events)


if __name__ == "__main__":
    main()

