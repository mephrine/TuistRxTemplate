import os.path, subprocess

current_file_path = os.path.dirname(os.path.abspath(__file__))
os.chdir(current_file_path)
os.chdir(os.pardir)

master_key_path = "Tuist/master.key"
command_open_ssl = ['openssl', 'rand', '-base64', '32']

open_ssl_key = subprocess.run(command_open_ssl, stdout=subprocess.PIPE).stdout.decode('utf-8')

if not os.path.isfile(master_key_path):
	subprocess.run(['touch', master_key_path])

master_key_file = open(master_key_path, 'w')
master_key_file.write(open_ssl_key)
master_key_file.close()