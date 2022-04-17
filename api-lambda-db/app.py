# -*- coding: utf-8 -*-
"""
Created from 2022.04.17
@author: Toyo_Daichi
"""
 
import boto3
from chalice import Chalice

"""config"""
app = Chalice(app_name='xray-api-lambda-db')
dynamoapi = boto3.resource('dynamodb')
s3api = boto3.resource('s3')
ssmapi = boto3.client('ssm')

"""Main"""
@app.route('/dynamodb')
def dynamodb():
  dynamo_table = dynamoapi.Table('xray-dynamodb-table')
  dynamo_item = dynamo_table.get_item(
    Key = {'name':'messages'}
  )

  return dynamo_item['Item']['contents']

@app.route('/s3')
def s3():
  bucket = s3api.Bucket('xray-s3-bucket')
  object = bucket.Object('contents.txt')
  response = object.get()
  body = response['Body'].read()

  return body.decode('utf-8')

@app.route('/ssm')
def ssm():
  ssm_parm = ssmapi.get_parameter(Name='xray-ssm-parm')
  
  return ssm_parm['Parameter']['Value']