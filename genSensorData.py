#test-python
import sys
import random

for line in sys.stdin:
    id = str(random.randint(0,50))
    nameList = ["Living", "Kitchen", "Bedroom"]
    name = random.choice(nameList)
    if "ERROR" in line:
        code = "toast"
        print("Error#" + id + ";" + name + ";code=0x8A72E33", file=sys.stderr, flush=True)
    else:
        minVal = 0
        maxval = 30
        value = str(random.randint(minVal,maxval))
        
        print("Capteur#" + id + ";" + name + ";minvalue="+str(minVal)+";maxvalue="+str(maxval)+";value="+value, file=sys.stdout, flush=True)
