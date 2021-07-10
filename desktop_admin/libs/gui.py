'''
Contains modules that control the graphical interface of the system
'''

import sys
from PyQt5 import uic, QtWidgets, QtGui


app = QtWidgets.QApplication(sys.argv)

class dynamex_ui(QtWidgets.QMainWindow):
	def __init__(self, king, ui_file='ui/admin_.ui'):
		super(dynamex_ui, self).__init__()
		uic.loadUi(ui_file, self)
		self.king = king # The main module admin

		self._set_data()
		self.set_navigation()
		self._set_callbacks()

		self.first_run()

	# **** System Inner Functions ****
	def first_run(self):
		# First function to run everytime admin starts to keep things in order
		self.main_stack.setCurrentIndex(0)

		self.login_error.setText('')

		self.actionProgress.setEnabled(False)
		self.actionAdmin_Info.setEnabled(False)
		self.actionIncoming_Messages.setEnabled(False)
		self.actionLog_Out.setEnabled(False)
		self.actionHelp.setEnabled(False)

	def _set_data(self):
		# To initialize some data in need
		self.login_error_text = '<html><head/><body><p align="center"><span style=" font-size:12pt; color:#ef2929;">HERE</span></p></body></html>'
		self.admin_name_text = '<html><head/><body><p align="center"><span style=" font-size:12pt; color:#b6289c;">HERE</span></p></body></html>'

	def _set_callbacks(self):
		self.login_.clicked.connect(self.king.login)
		self.actionLog_Out.triggered.connect(self.king.log_out)
		self.actionProgress.triggered.connect(
				lambda: self.semi_stack.setCurrentIndex(0)
			)

		self.navigation.itemClicked.connect(self.navigation_clicked)

	def set_navigation(self):
		# Adds navigation list to view
		nav_items = {
			'Progress': 'user-home',
			'Tickets': 'emblem-documents',
			'Transactions': 'view-restore',
			'Messages': 'mail-send-receive',
			'Bus Control': 'emblem-downloads',
			'Drivers': 'face-monkey',
			'Passagers': 'x-office-address-book',
			'Adminstrators': 'security-medium',
			'Routes': 'view-fullscreen',
			'Locations': 'insert-link',
			'Auto Test': 'format-text-italic'
		}
		for nav in nav_items:
			item = QtWidgets.QListWidgetItem(nav)
			icon = QtGui.QIcon.fromTheme(nav_items[nav])
			item.setIcon(icon)
			self.navigation.addItem(item)
	
	def navigation_clicked(self, item):
		# Functions of changing screen according to navigation
		nav_item = item.text().lower()
		if nav_item == 'progress':
			self.semi_stack.setCurrentIndex(0)
		elif nav_item == 'tickets':
			self.tickets_tab.setCurrentIndex(0)
			self.semi_stack.setCurrentIndex(1)
		elif nav_item == 'transactions':
			self.semi_stack.setCurrentIndex(2)
		elif nav_item == 'messages':
			self.semi_stack.setCurrentIndex(3)
		elif nav_item == 'bus control':
			self.bus_control_tab.setCurrentIndex(0)
			self.semi_stack.setCurrentIndex(4)
		elif nav_item == 'drivers':
			self.semi_stack.setCurrentIndex(5)
		elif nav_item == 'passagers':
			self.semi_stack.setCurrentIndex(6)
		elif nav_item == 'adminstrators':
			self.semi_stack.setCurrentIndex(7)
		elif nav_item == 'routes':
			self.routes_tab.setCurrentIndex(0)
			self.semi_stack.setCurrentIndex(8)
		elif nav_item == 'locations':
			self.locations_tab.setCurrentIndex(0)
			self.semi_stack.setCurrentIndex(9)
		elif nav_item == 'auto test':
			self.semi_stack.setCurrentIndex(10)
	##################################
	# **** Functions needed by dynamex admin ****
	#############################################
	# **** Dialog Functions ****
	def show_message(self, type_, heading, _msg):
		msg = QtWidgets.QMessageBox()
		if type_.lower() == 'question':
			msg.setIcon(QtWidgets.QMessageBox.Question)
		elif type_.lower() == 'warning':
			msg.setIcon(QtWidgets.QMessageBox.Warning)
		elif type_.lower() == 'critical':
			msg.setIcon(QtWidgets.QMessageBox.Critical)
		else:
			msg.setIcon(QtWidgets.QMessageBox.Information)

		msg.setWindowTitle(heading)
		msg.setText(_msg)
		msg.setStandardButtons(QtWidgets.QMessageBox.Ok)
		msg.exec_()
	############################

