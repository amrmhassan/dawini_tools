from constants.urls import getPageUrl
from parsers.files import saveFile
import requests


# driver = get_driver()


for i in range(1035):
    page_number = i+1
    page_url = getPageUrl(page_number)
    r = requests.get(page_url)
    content = r.text
    # driver.get(page_url)
    # content = driver.page_source
    saveFile(page_number, content=content)
    print(f'Page {page_number} saved!')

print('***All Done***')
