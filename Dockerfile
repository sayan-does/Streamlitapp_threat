FROM nvidia/cuda:11.3.1-base-ubuntu20.04

# Install required system packages including OpenGL
RUN apt-get update && apt-get install -y \
    libgl1-mesa-glx \
    libgl1-mesa-dev \
    && rm -rf /var/lib/apt/lists/*

# Install Python packages
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Set the working directory
WORKDIR /app

# Copy the entire app directory
COPY . .

# Set the command to run the Streamlit app
CMD ["streamlit", "run", "main.py"]
