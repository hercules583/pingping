#!/usr/bin/env python
#!-*- coding:utf-8 -*-
import requests
import json
import selenium
from selenium import webdriver
import time
# 作文大全
def zuowen(zuowen_ip,key,id):
	url="http://%s/zuowen/typeList"%(zuowen_ip)
	param={"key":key,"id":id}
	res=requests.get(url,param)
	re=res.json()
	return re['reason']

def OB(browser_url):
	global dr
	dr = webdriver.Chrome()
	dr.maximize_window()
	dr.get(browser_url)
	return
import pdb
def register(ip,port,mobile_phone,pwd,type,reg_name):
	#pdb.set_trace()
	url = 'http://%s:%s/futureloan/member/register'%(ip,port)
	param = {"mobile_phone":mobile_phone,"pwd":pwd,"type":type,"reg_name":reg_name}
	headers = {"X-Lemonban-Media-Type":"lemonban.v2","Content-Type":"application/json"}
	r = requests.post(url,json=param,headers=headers)
	# return r.headers
	if r.status_code == 200:
		return r.status_code, json.loads(r.content)
	else:
		return r.status_code, json.loads(r.content)

def login(ip,port,moblie_phone,pwd):
	url = "http://%s:%s/futureloan/member/login"%(ip,port)
	param = {"mobile_phone":moblie_phone, "pwd": pwd}
	headers = {"X-Lemonban-Media-Type": "lemonban.v2", "Content-Type": "application/json"}
	r = requests.post(url,json=param,headers=headers)
	if r.status_code == 200:
		return r.status_code, json.loads(r.content)
	else:
		return r.status_code, json.loads(r.content)

def recharge(ip,port,member_id,amount,token_id):
	url = "http://%s:%s/futureloan/member/recharge"%(ip,port)
	param = {"member_id":member_id, "amount": amount}
	Authorization='Bearer' +' '+token_id
	headers = {"X-Lemonban-Media-Type": "lemonban.v2", "Content-Type": "application/json","Authorization":Authorization}
	r = requests.post(url,json=param,headers=headers)
	if r.status_code == 200:
		return r.status_code, json.loads(r.content)
	else:
		return r.status_code, json.loads(r.content)

def withdraw(ip,port,member_id,amount,token_id):
	url = "http://%s:%s/futureloan/member/withdraw"%(ip,port)
	param = {"member_id":member_id, "amount": amount}
	Authorization='Bearer' +' '+token_id
	headers = {"X-Lemonban-Media-Type": "lemonban.v2", "Content-Type": "application/json","Authorization":Authorization}
	r = requests.post(url,json=param,headers=headers)
	if r.status_code == 200:
		return r.status_code, json.loads(r.content)
	else:
		return r.status_code, json.loads(r.content)

def update(ip,port,member_id,reg_name,token_id):
	url = "http://%s:%s/futureloan/member/update"%(ip,port)
	param = {"member_id":member_id, "reg_name": reg_name}
	Authorization='Bearer' +' '+token_id
	headers = {"X-Lemonban-Media-Type": "lemonban.v2", "Content-Type": "application/json","Authorization":Authorization}
	r = requests.patch(url,json=param,headers=headers)
	if r.status_code == 200:
		return r.status_code, json.loads(r.content)
	else:
		return r.status_code, json.loads(r.content)

def info(ip,port,member_id,token_id):
	url = "http://%s:%s/futureloan/member/%s/info"%(ip,port,member_id)
	Authorization='Bearer' +' '+token_id
	headers = {"X-Lemonban-Media-Type": "lemonban.v2","Authorization":Authorization}
	r = requests.get(url,headers=headers)
	if r.status_code == 200:
		return r.status_code, json.loads(r.content)
	else:
		return r.status_code, json.loads(r.content)

def add(ip,port,member_id,title,amount,loan_rate,loan_term,loan_date_type,bidding_days,token_id):
	url = "http://%s:%s/futureloan/loan/add"%(ip,port)
	param = {"member_id":member_id, "title": title,"amount":amount,"loan_rate":loan_rate,"loan_term":loan_term,"loan_date_type":loan_date_type,"bidding_days":bidding_days}
	Authorization='Bearer' +' '+token_id
	headers = {"X-Lemonban-Media-Type": "lemonban.v2", "Content-Type": "application/json","Authorization":Authorization}
	r = requests.post(url,json=param,headers=headers)
	if r.status_code == 200:
		return r.status_code, json.loads(r.content)
	else:
		return r.status_code, json.loads(r.content)

def audit(ip,port,loan_id,approved_or_not,token_id):
	url = "http://%s:%s/futureloan/loan/audit"%(ip,port)
	param = {"loan_id":loan_id, "approved_or_not": approved_or_not}
	Authorization='Bearer' +' '+token_id
	headers = {"X-Lemonban-Media-Type": "lemonban.v2", "Content-Type": "application/json","Authorization":Authorization}
	r = requests.patch(url,json=param,headers=headers)
	if r.status_code == 200:
		return r.status_code, json.loads(r.content)
	else:
		return r.status_code, json.loads(r.content)

def invest(ip,port,member_id,loan_id,amount,token_id):
	url = "http://%s:%s/futureloan/member/invest"%(ip,port)
	param = {"member_id":member_id,"loan_id":loan_id, "amount": amount}
	Authorization='Bearer' +' '+token_id
	headers = {"X-Lemonban-Media-Type": "lemonban.v2", "Content-Type": "application/json","Authorization":Authorization}
	r = requests.post(url,json=param,headers=headers)
	if r.status_code == 200:
		return r.status_code, json.loads(r.content)
	else:
		return r.status_code, json.loads(r.content)

def loans(ip,port,pageIndex,pageSize,token_id):
	url = "http://%s:%s/futureloan/loans?%s&%s"%(ip,port,pageIndex,pageSize)
	Authorization='Bearer' +' '+token_id
	headers = {"X-Lemonban-Media-Type": "lemonban.v2","Authorization":Authorization}
	r = requests.get(url,headers=headers)
	if r.status_code == 200:
		return r.status_code, json.loads(r.content)
	else:
		return r.status_code, json.loads(r.content)


# def OB(browser_url):
# 	driver = webdriver.Chrome()
# 	driver.maximize_window()
# 	driver.get(browser_url)
# 	driver.find_element_by_id("kw").send_keys("中国")
# 	driver.find_element_by_id('su').submit()
# 	time.sleep(2)
if __name__ == '__main__':
	ip='120.78.128.25'
	port='8766'
	moblie_phone='18206264880'
	pwd='houlei5837'
	login_info=login(ip, port, moblie_phone, pwd)
	token_id=login_info[1]["data"]["token_info"]["token"]
	id=login_info[1]["data"]["id"]
	re=info(ip, port, id, token_id)
	print (re)
# 	#pdb.set_trace()
# 	re=login('120.78.128.25', 8766, 18206264880, 'houlei5837')
# 	print (re)
	#re=OB('https://www.baidu.com')
# r=zuowen("zuowen.api.juhe.cn","04adb605ebad26611e9c20059e900b1b",2)
# print (r)
# 	print (type(r))
# 	# print (re['result']['id'])
