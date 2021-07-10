'''
This file contains the main called function of the dynamex_admin
'''

import os
import time

from libs import connector, gui


class dynamex_admin():
	def __init__(self):
		self.gui = gui.dynamex_ui(self)
		self.conn = connector.dynamex_connect(self)

	# **** System Inner Fucntions ****
	def start_updater(self):
		pass
	##################################

	# **** Callback Functions ****
	def login(self):
		# Logs the admin to the server
		pas = False
		username = self.gui.username.text()
		password = self.gui.password.text()
		if username != '':
			if password != '':
				pas = True
			else:
				self.gui.login_error.setText(
						self.gui.login_error_text.replace('HERE', 'Please Input Your Password')
					)
		else:
			self.gui.login_error.setText(
					self.gui.login_error_text.replace('HERE', 'Please Input Your Username')
				)
		if pas:
			reply = self.conn.login(username, password)
			if not reply['access']:
				self.gui.login_error.setText(
						self.gui.login_error_text.replace('HERE', reply['error'])
					)
			else:
				self.gui.actionProgress.setEnabled(True)
				self.gui.actionAdmin_Info.setEnabled(True)
				self.gui.actionIncoming_Messages.setEnabled(True)
				self.gui.actionLog_Out.setEnabled(True)
				self.gui.actionHelp.setEnabled(True)

				self.gui.admin_name.setText(
						self.gui.admin_name_text.replace('HERE', username)
					)

				self.start_updater()

				self.gui.semi_stack.setCurrentIndex(0)
				self.gui.main_stack.setCurrentIndex(1)

				self.gui.username.setText('')
				self.gui.password.setText('')

	def log_out(self):
		# Logs the admin out of the server
		got = self.conn.log_out()
		if not got['access']:
			self.gui.show_message('warning', 'Log Out Error', got['error'])
		elif got['reply'].lower() == 'logged out':
			self.gui.first_run()
	##########################


def main():
	admin = dynamex_admin()
	admin.gui.show()
	gui.app.exec_()

if __name__ == '__main__':
	main()