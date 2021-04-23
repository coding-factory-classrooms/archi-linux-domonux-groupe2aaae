#test-python
#import system and random library
import sys 
import random # allow the generation of random numbers.

#makes a loop for all line inputs
for line in sys.stdin:
    # generate random parameters (0 to 50 id's)
    id = str(random.randint(0,50))
    #define a rooms list
    nameList = ["Living", "Kitchen", "Bedroom"]
    name = random.choice(nameList)
    
    #if a error occured on the genTick write a error
    if "ERROR" in line:
        code = "toast"
        print("Error#" + id + ";" + name + ";code=0x8A72E33", file=sys.stderr, flush=True)
    #if no error occured, write all details
    else:
        minVal = 0
        maxval = 30
        value = str(random.randint(minVal,maxval))
        
        #allow to have the resultat of the sensors in real time
        print("Capteur#" + id + ";" + name + ";minvalue="+str(minVal)+";maxvalue="+str(maxval)+";value="+value, file=sys.stdout, flush=True)
