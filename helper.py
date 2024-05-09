from ultralytics import YOLO
import streamlit as st
import cv2
import numpy as np
# 
import tempfile
from pathlib import Path
import os


import settings

def load_model(model_path):
    model = YOLO(model_path)
    return model

def _display_detected_frames(conf, model, st_frame, image):
    # Resize the image to a standard size
    image = cv2.resize(image, (720, int(720*(9/16))))
    
    # Predict the objects in the image using the YOLOv8 model
    res = model.predict(image, conf=conf)
       
    # Plot the detected objects on the video frame
    res_plotted = res[0].plot()
    st_frame.image(res_plotted,
                   caption='Detected Video',
                   channels="BGR",
                   use_column_width=True
                   )


def play_user_video(conf, model):
    st.sidebar.write("Upload a video for object detection:")
    uploaded_video = st.sidebar.file_uploader(
        "Choose a video...", type=["mp4", "avi"])

    if uploaded_video is not None:
        try:
            # Use a temporary file to store the uploaded video
            temp_video_path = Path(tempfile.mktemp(suffix=".mp4"))
            temp_video_path.write_bytes(uploaded_video.read())

            # Open the temporary video file for processing
            vid_cap = cv2.VideoCapture(str(temp_video_path))
            st_frame = st.empty()
            while (vid_cap.isOpened()):
                success, image = vid_cap.read()
                if success:
                    _display_detected_frames(conf, model, st_frame, image)
                else:
                    vid_cap.release()
                    break

        except Exception as e:
            st.sidebar.error("Error loading video: " + str(e))
