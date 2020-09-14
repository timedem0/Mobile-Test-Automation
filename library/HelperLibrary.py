import os
import json
import logging
import re

from random import randint
from datetime import datetime
from robot.api.deco import keyword
from robot.libraries.BuiltIn import BuiltIn


class HelperLibrary:

    def __init__(self):
        self.logger = logging.getLogger(__name__)

    @keyword ('Get Desired Capabilities')
    def get_desired_capabilities(self) -> dict:
        desired_capabilities = os.path.join(os.path.dirname(__file__), '../json/desired_capabilities.json')
        with open(desired_capabilities) as json_file:
            return json.load(json_file)

    @keyword ('Get Random Integer')
    def get_random_integer(self, min_value, max_value) -> int:
        return randint(int(min_value), int(max_value))

    @keyword ('Toggle WiFi')
    def toggle_wifi(self):
        driver = self._get_webdriver_instance()
        driver.toggle_wifi()
        self.logger.info('Toggling WiFi Connection.')

    @keyword ('Capture Timestamped Screenshot With Test Name')
    def capture_page_screenshot(self):
        driver = self._get_webdriver_instance()
        logdir = self._get_log_dir()
        filename = self._compose_screenshot_filename()
        path = os.path.join(logdir, filename)
        driver.get_screenshot_as_file(path)
        self.logger.info(f'Writing {path} as Objective Evicence.')

    def _compose_screenshot_filename(self) -> str:
        return self._get_timestamp() + '_' + self._get_sanitized_testname() + '.png'

    def _get_timestamp(self) -> str:
        dateTimeObj = datetime.now()
        return dateTimeObj.strftime('%d-%b-%Y_%H-%M-%S')

    def _get_sanitized_testname(self) -> str:
        testname = BuiltIn().get_variable_value('${TEST NAME}')
        sanitized_testname = re.sub(r'[^\w\.!@#$^+=-]', '_', testname)
        return sanitized_testname

    def _get_log_dir(self) -> str:
        return BuiltIn().get_variable_value('${OUTPUTDIR}')

    def _get_webdriver_instance(self):
        appium_instance = BuiltIn().get_library_instance('AppiumLibrary')
        return appium_instance._current_application()
