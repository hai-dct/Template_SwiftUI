import re
import sys


APPNAME_REGEX = r'^[_a-zA-Z][_a-zA-Z0-9]+$'

app_name = '{{ cookiecutter.project_name }}'

if not re.match(APPNAME_REGEX, app_name):
    print('ERROR: %s is not a valid App Name! \n Please enter alpha-numeric app name...' % app_name)
    # exits with status 1 to indicate failure
    sys.exit(1)

{{ cookiecutter.update({'project_name': cookiecutter.project_name.title().replace(' ', '').replace('-', '').replace('_', '') }) }}
