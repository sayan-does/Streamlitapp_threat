FROM nvidia/cuda:11.3.1-base-ubuntu20.04

# Update package repositories
RUN apt-get update

# Install required system packages
RUN apt-get install -y \
    libgl1-mesa-glx \
    && rm -rf /var/lib/apt/lists/*

# Install Python packages
RUN pip install --no-cache-dir -r requirements.txt

# Set the working directory
WORKDIR /app

# Copy the entire app directory
COPY . .

# Set the command to run the Streamlit app
CMD ["streamlit", "run", "app.py"]
