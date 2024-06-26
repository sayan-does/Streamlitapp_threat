from pathlib import Path
import sys

# the absolute path of the current file
file_path = Path(__file__).resolve()

# the parent directory of the current file
root_path = file_path.parent

# Add the root path to the sys.path list if it is not already there
if root_path not in sys.path:
    sys.path.append(str(root_path))

# Get the relative path of the root directory with respect to the current working directory
ROOT = root_path.relative_to(Path.cwd())

# Sources
IMAGE = 'Image'
VIDEO = 'Video'
SOURCES_LIST = [IMAGE, VIDEO]

# Images config
DEFAULT_IMAGE = 'gun1.jpg'
DETECTED_IMAGE = 'detected_image.jpg'

# # Videos config
# VIDEO_1_PATH =  'demo.mp4'
# VIDEOS_DICT = {
#     'video_1': VIDEO_1_PATH
# }

# ML Model config
DETECTION_MODEL = 'BestFinal.pt'
