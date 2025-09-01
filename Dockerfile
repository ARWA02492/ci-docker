# 1) Base image
FROM python:3.10-slim

# 2) Prevent .pyc files and enable unbuffered logs
# the first one---> prevent python from generating .pyc (cached files) -> keeps the image smaller
# the second one---->show logs immediately (no buffering)
ENV PYTHONDONTWRITEBYTECODE=1   
ENV PYTHONUNBUFFERED=1

# 3) Create work directory
WORKDIR /app

# 4) Install dependencies first (better caching)
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

# 5) Copy app source code
COPY . .

# 6) Expose port and run
EXPOSE 5000
CMD ["flask", "run", "--host=0.0.0.0", "--port=5000"]
