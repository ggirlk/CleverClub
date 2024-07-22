# Use the official Python image from the Docker Hub
FROM python:3.10

# Set environment variables
ENV PYTHONUNBUFFERED 1

# Create and set the working directory
RUN mkdir /app
WORKDIR /app

# install python and pip, and delete cache
RUN apt update && apt install -y python3 python3-pip && rm -rf /var/lib/apt/lists/*

# Install dependencies
COPY requirements.txt /app/

RUN pip install --no-cache-dir -r requirements.txt

# Copy the project files into the working directory
COPY . /app/

# Copy your Nginx configuration file
COPY nginx/conf.d /etc/nginx/conf.d

# Expose port 8000 for the Django development server
# EXPOSE 8000

# Run the Django development server
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
