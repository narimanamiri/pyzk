from zk import ZK
from datetime import datetime, time
#from datetime import date
# IP address and port of the ZKTeco LX14 device
device_ip = '192.168.20.247'
device_port = 4370

# Connect to the device
zk = ZK(device_ip, device_port)
conn = None
try:
    conn = zk.connect()
    if conn:
        print("Connected to the device.")
        # Get the current device time
        device_time = zk.get_time()
        print("Current device time:", device_time)
        #zk.set_time(2023-08-23 03:44:32)
        #newtime = datetime.today()
        #date = date.today()
        #current_datetime = datetime.combine(datetime.today(), time(7,30))
        #current_date = current_datetime.date()
        current_datetime = datetime.today()
        print(current_datetime)
        zk.set_time(current_datetime)
        #print("Current date and time:", current_datetime)
        #new_time = time.strftime("%Y-%m-%d %H:%M:%S")
        #print(current_date)
    else:
        print("Could not connect to the device.")

except Exception as e:
    print("Error:", str(e))

finally:
    if conn:
        conn.disconnect()
        print("Disconnected from the device.")
