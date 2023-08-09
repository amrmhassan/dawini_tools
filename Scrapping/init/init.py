from selenium.webdriver.chrome.service import Service
from selenium import webdriver


def get_driver():
    service = Service(executable_path="./chromedriver.exe")
    driver = webdriver.Chrome(service=service)
    return driver
