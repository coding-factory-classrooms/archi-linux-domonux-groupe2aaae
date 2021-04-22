#test-python
import sys

for line in sys.stdin:
    if "ERROR" in line:
        print("Error#30;Cuisine;code=0x8A72E33", file=sys.stderr, flush=True)
    else:
        print("Capteur#45;Salon;minvalue=10;maxvalue=25;value=18", file=sys.stdout, flush=True)
