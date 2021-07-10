'''
This file contains the module used to communicate to the server to get and post information
'''

import requests
import json


class dynamex_connect:
	def __init__(self, king, url="http://localhost:4567"):
		self.king = king
		self.url = url
		self.session = requests.Session()

	# **** System Inner Fucntions ****
	##################################

	# **** Functions needed by dynamex admin ****
	def login(self, name, password):
		# Logins in session
		self.login_info = {
			'username': name,
			'password': password
		}
		got = self.session.post(self.url+'/includes/admin-login.php', data=self.login_info)

		try:
			return json.loads(got.text.strip())
		except Exception as e:
			print('error')
			return {
				'access': False,
				'error': str(e)
			}

	def log_out(self):
		# Closes the ongoing admin session in server
		dt = {
			'mode': 'log_out'
		}
		got = self.session.post(self.url+'/includes/admin-login.php', data=dt)

		try:
			return json.loads(got.text.strip())
		except Exception as e:
			print('Error :', got.text.strip())
			return {
				'access': False,
				'error': str(e)
			}
	#############################################