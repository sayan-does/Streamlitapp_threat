# Threat Detection Using YOLOv8

![Project Logo](path/to/logo.png)

## Table of Contents

- [Introduction](#introduction)
- [YOLO Architecture](#yolo-architecture)
- [Usage](#usage)
- [Parameters Intuition](#parameters-intuition)
- [Result Metrics](#result-metrics)
- [Streamlit App](#streamlit-app)

## Introduction

This project focuses on detecting threats such as guns and sharp weapons (e.g., knives) in real-time using the YOLOv8 object detection model. By analyzing video feeds or images, the system can promptly identify and alert authorities or security personnel to potential security risks. This technology can be applied in public spaces, airports, and other security-sensitive environments to enhance safety and security measures.

![Sample Detection](detected_image.jpg)

## YOLO Architecture

YOLO (You Only Look Once) is a state-of-the-art, real-time object detection system. The main concept behind YOLO is to frame object detection as a single regression problem, straight from image pixels to bounding box coordinates and class probabilities.

### Key Features of YOLO

- **Unified Detection**: YOLO divides the image into an SxS grid and predicts bounding boxes and probabilities for each grid cell.
- **Single Pass Detection**: Instead of sliding windows or region proposals, YOLO makes predictions with a single network evaluation.
- **End-to-End Training**: The detection pipeline is trained end-to-end directly on detection performance.

### YOLOv8 Enhancements

- **Improved Backbone**: Enhanced network architecture for better feature extraction.
- **Anchor-Free Design**: Reduces the complexity of anchor-based predictions.
- **Optimized for Speed and Accuracy**: Balances the trade-off between inference speed and detection accuracy.

![YOLO Architecture](path/to/yolo_architecture.png)

## Usage

To set up and run the threat detection model on images or videos, follow these steps:

1. **Clone the Repository**:
    ```bash
    git clone https://github.com/sayan-does/threat-detection.git
    cd threat-detection
    ```

2. **Create a Virtual Environment**:
    ```bash
    python -m venv venv
    source venv/bin/activate  # On Windows use `venv\Scripts\activate`
    ```

3. **Install Dependencies**:
    ```bash
    pip install -r requirements.txt
    ```

4. **Download Pre-trained Weights**:
    Download the pre-trained YOLOv8 weights and place them in the `weights` directory.

5. **Run the Streamlit App**:
    ```bash
    streamlit run main.py
    ```

## Parameters Intuition

### Key Parameters

- **Confidence Threshold (`confidence`)**: This parameter controls the minimum confidence score for a detection to be considered valid. Increasing this value will reduce the number of false positives but may also reduce the number of true positives.

### Tuning Tips

- **Lower Confidence**: Use a lower confidence threshold if you want to capture more objects, at the risk of increasing false positives.
- **Higher Confidence**: Use a higher confidence threshold to reduce false positives, at the risk of missing some true positives.

## Result Metrics

### Detection Metrics

- **Precision**: XX.XX%
- **Recall**: XX.XX%
- **F1 Score**: XX.XX%
- **Inference Time**: XX ms/frame

![Detection Results](path/to/detection_results.png)

## Streamlit App

The Streamlit app provides an interactive interface for uploading images or videos and performing threat detection.

### Main Features

- **Model Configuration**: Adjust the confidence threshold for detection.
- **Image/Video Upload**: Upload images or videos for detection.
- **Real-Time Detection**: View detected threats in real-time with bounding boxes.

### Running the App

To run the Streamlit app, use the following command:

```bash
streamlit run main.py
