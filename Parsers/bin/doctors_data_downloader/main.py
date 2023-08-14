import os
import requests
import json

path = 'D:/Study And Work/Work/projects/flutter/Dart Mastery/dawini_tools/Parsers/data/doctors/doctors.json'
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
            response = requests.get(link)
            response.raise_for_status()  # Raise an exception for bad response status
            html_content = response.text

            # Save the HTML content to a file
            filename = os.path.join(output_folder, f'{doctor_id}.html')
            with open(filename, 'w', encoding='utf-8') as html_file:
                html_file.write(html_content)

            print(f"Downloaded {filename}")

        except requests.exceptions.RequestException as e:
            print(f"Error downloading {link}: {e}")
