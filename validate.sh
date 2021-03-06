#!/bin/bash
set -e # exit on error
wget "http://ocds.open-contracting.org/standard/r/1__0__0/release-package-schema.json"
wget "http://ocds.open-contracting.org/standard/r/1__0__0/release-schema.json"
cd fictional-example
# Check that files validate
for f in *.json; do echo $f; jsonschema ../release-package-schema.json -i  $f; done
# Check that running merge.py produces the same output as what's curently in
cp record/ocds-213czf-000-00001.json record/ocds-213czf-000-00001.json.OLD && python merge.py && diff record/ocds-213czf-000-00001.json.OLD record/ocds-213czf-000-00001.json
# the repo
