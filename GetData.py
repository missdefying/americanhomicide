# -*- coding: utf-8 -*-
"""
Download FBI Supplementary Homicide Report from murderdata.org

"""
#import os
import zipfile
import requests

url = 'https://www.dropbox.com/s/vwpyz3cfxwmilk5/SHR76_16.csv.zip?dl=1'

def download_file(url,filename):
    r = requests.get(url, allow_redirects=True)
    open(filename, 'wb').write(r.content)

def unzip_and_delete(filename, dir):
    zip_file = zipfile.ZipFile(filename,'r')
    zip_file.extractall(dir)
    zip_file.close()
#    os.remove(filename)
    
download_file(url, 'data/SHR76_16.csv.zip')

unzip_and_delete('data/SHR76_16.csv.zip', 'data')
    

