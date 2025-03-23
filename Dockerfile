FROM tensorflow/tensorflow:2.2.0-py3

WORKDIR /app
COPY requirements.txt .

# Install other dependencies (TensorFlow is already installed)
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application
COPY . .

EXPOSE 8501
ENTRYPOINT ["streamlit", "run"]
CMD ["app.py"]
