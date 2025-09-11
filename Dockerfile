FROM python:3.11-slim

# Prevents Python from buffering stdout/stderr and ensures imports work
ENV PYTHONUNBUFFERED=1
ENV PYTHONPATH=/app

# Set working directory
WORKDIR /app

# Install dependencies
COPY requirements.txt /app/requirements.txt
RUN pip install --upgrade pip && pip install -r /app/requirements.txt

# Copy application code
COPY ./app /app

# Ensure data folder exists
RUN mkdir -p /app/data

EXPOSE 8000

# ✅ Load main.py directly (not "app.main")
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]

