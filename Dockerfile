# Use a base image with required OpenGL libraries
FROM nvidia/cuda:11.3.1-base-ubuntu20.04

# Install required system packages
RUN apt-get update && apt-get install -y \
    libgl1-mesa-glx \
    && rm -rf /var/lib/apt/lists/*

# Set the working directory
WORKDIR /app

# Copy the requirements file
COPY requirements.txt .

# Install the dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the entire app directory
COPY . .

# Set the command to run the Streamlit app
CMD ["streamlit", "run", "app.py"]