#test-python
import sys

for line in sys.stdin:
    if "ERROR" in line:
        print("ERR " + line + ".", file=sys.stderr)
    else:
        print("standard " + line + ".", file=sys.stdout)
