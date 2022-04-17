# -*- coding: utf-8 -*-
"""
Created from 2022.04.08
@author: Toyo_Daichi
"""

from chalice import Chalice

"""config"""
app = Chalice(app_name='xray-api-lambda')

"""Main"""
@app.route('/hello')
def main():
  return {'messages': 'Hello world!'}
