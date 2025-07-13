# this is your base image
FROM python:3.9-slim-buster
# we set the working dir in your container
WORKDIR /app
# copying reqs file to your container so you can install the app reqs
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
# copy your app code
COPY . .
# expose/open up the port on your container so you can access your app
EXPOSE 5002
# running app in container
CMD ["python", "app.py"]