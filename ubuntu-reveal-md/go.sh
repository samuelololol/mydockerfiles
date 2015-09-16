#!/bin/bash
$(cat package.json| python -c 'import json,sys;obj=json.load(sys.stdin);print obj["bin"][obj["bin"].keys()[0]];') $@

