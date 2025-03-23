FROM tensorflow/tensorflow:2.2.0-py3

COPY . /app
WORKDIR /app

# Install other dependencies (TensorFlow is already installed)
RUN pip install streamlit opencv-python-headless numpy==1.19.2 Pillow validators requests

EXPOSE 8501
ENTRYPOINT ["streamlit","run"]
CMD ["app.py"]
