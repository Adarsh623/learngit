# Use the official Python image as a parent image
FROM ubuntu:latest

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install Flask

RUN apt-get update
RUN apt-get install -y python3 python3-pip 
RUN pip install -r requirements.txt
    
RUN pip install Flask
# Make port 5000 available to the world outside this container
EXPOSE 5000

# Run app.py when the container launches
CMD ["python", "app.py"]

