# This Python file uses the following encoding: utf-8
import sys
import ctypes
from pathlib import Path

from PySide6.QtGui import QGuiApplication
from PySide6.QtQml import QQmlApplicationEngine
from PySide6.QtCore import QObject, Slot
import pyautogui
import keyboard

class HandlerText(QObject):
    def __init__(self):
        QObject.__init__(self)
        self.text = "Hello, World!"

    @Slot(str)
    def assign_hotkey1(self, hotkey):
        keyboard.add_hotkey(hotkey, image_path_updater.move_and_click_image)
    @Slot(str)   
    def assign_hotkey2(self, hotkey):
        keyboard.add_hotkey(hotkey, image_path_updater2.move_and_click_image)

class ImagePathUpdater(QObject):
    def __init__(self):
        QObject.__init__(self)
        self.image_path = ''

    @Slot(str)
    def update_image_path(self, path):
        path = path.replace('file:///', '')
        self.image_path = path
        print(f"Image path updated to: {self.image_path}")

    def move_and_click_image(self):
        image_location = find_image_on_screen(self.image_path)
        # Process the result
        if image_location is not None:
            # Image found
            print("Image found at location:", image_location)
            center_x = image_location[0] + image_location[2] / 2  # X coordinate of the center of the image
            center_y = image_location[1] + image_location[3] / 2  # Y coordinate of the center of the image
            for _ in range(2):  # Perform 2 clicks
               pyautogui.moveTo(center_x, center_y)
               pyautogui.click(center_x, center_y)  # Click on the specified position
            # You can perform further actions here, such as clicking on the image
            # using pyautogui.click(image_location)
        else:
            # Image not found
            print("Image not found on the screen.")


def find_image_on_screen(image_path):
    try:
        location = pyautogui.locateOnScreen(image_path, confidence=0.5)
        if location is not None:
            # Image found
            return location
        else:
            # Image not found
            return None
    except Exception as e:
        print(f"An error occurred: {str(e)}")
        print(f"Exception type: {type(e)}")
        return None

if __name__ == "__main__":
    try:
        ctypes.windll.user32.SetProcessDpiAwarenessContext(2)  # DPI_AWARENESS_CONTEXT_PER_MONITOR_AWARE_V2
    except AttributeError:
        try:
            ctypes.windll.shcore.SetProcessDpiAwareness(2)  # PROCESS_PER_MONITOR_DPI_AWARE
        except AttributeError:
            pass

    app = QGuiApplication(sys.argv)
    engine = QQmlApplicationEngine()
    qml_file = Path(__file__).resolve().parent / "main.qml"
    engine.load(qml_file)
    if not engine.rootObjects():
        sys.exit(-1)
    handler_text = HandlerText()
    engine.rootContext().setContextProperty("handlerText", handler_text)
    handler_text2 = HandlerText()
    engine.rootContext().setContextProperty("handlerText2", handler_text2)
    image_path_updater = ImagePathUpdater()
    engine.rootContext().setContextProperty("imagePathUpdater", image_path_updater)
    image_path_updater2 = ImagePathUpdater()
    engine.rootContext().setContextProperty("imagePathUpdater2", image_path_updater2)

    sys.exit(app.exec())
