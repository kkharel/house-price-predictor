FROM python:3.12-slim

# Upgrade pip, setuptools, wheel
RUN pip install --upgrade pip setuptools wheel

WORKDIR /app

# Copy API code
COPY src/api/ .

# Copy requirements and install Python packages
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy trained models
COPY models/trained/*.pkl models/trained/

# Expose port
EXPOSE 8000

# Start FastAPI
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
