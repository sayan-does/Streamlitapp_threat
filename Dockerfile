# Use the official Streamlit image as the base image
FROM streamlit/streamlit:latest

# Install system-level dependencies
RUN apt-get update && \
    apt-get install -y libgl1-mesa-dev

# Set the working directory in the container
WORKDIR /app

# Copy the requirements.txt file and install Python dependencies
COPY requirements.txt ./requirements.txt
RUN pip install -r requirements.txt

# Copy the contents of the app directory into the container
COPY . .

# Set the default command to run when the container starts
CMD ["streamlit", "run", "your_app_file.py"]
