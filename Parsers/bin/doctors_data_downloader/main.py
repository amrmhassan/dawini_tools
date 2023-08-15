import os
import requests
import json
import sys

windows_path = 'D:/Study And Work/Work/projects/flutter/Dart Mastery/dawini_tools/Parsers/unDuplicatedIdsDoctors.json'
linux_path = '/home/ubuntu/downloads/dawini_tools/Parsers/unDuplicatedIdsDoctors.json'

if sys.platform.startswith('win'):
    path = windows_path
else:
    path = linux_path

output_folder = 'output_doctors'

# Create the output folder if it doesn't exist
os.makedirs(output_folder, exist_ok=True)

with open(path, 'r', encoding='utf-8') as json_file:
    data = json.load(json_file)
    for index, item in enumerate(data, start=1):
        link = item['link']
        doctor_id = item['id']
        print(link)
        # Download the HTML page
        try:
            filename = os.path.join(output_folder, f'{doctor_id}.html')
            if os.path.exists(filename):
                print(f'file {filename} exists')
                continue
            response = requests.get(link)
            response.raise_for_status()  # Raise an exception for bad response status
            html_content = response.text

            # Save the HTML content to a file

            # os.
            with open(filename, 'w', encoding='utf-8') as html_file:
                html_file.write(html_content)

            print(f"Downloaded {filename}")

        except requests.exceptions.RequestException as e:
            print(f"Error downloading {link}: {e}")
