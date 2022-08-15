import sys
import json

print(json.dumps({"Verb": "Hello", "Noun": "World", "Value": 1337}))
print(repr(sys.argv[1:]))