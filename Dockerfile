# 1. Start with a Python 3.8 base image
FROM python:3.8

# 2. Set working directory inside container
WORKDIR /app

# 3. Copy all files to /app
COPY . /app

# 4. Install dependencies
RUN pip install -r requirements.txt

# 5. Run the application
CMD ["python", "app.py"]
