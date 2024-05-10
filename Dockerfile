# Use the base image with required OpenGL libraries
FROM python:3.9-bullseye

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