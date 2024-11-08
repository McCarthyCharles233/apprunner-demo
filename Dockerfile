FROM python:3.9-slim

COPY . /app

WORKDIR /app//

RUN pip install --no-cache-dir --upgrade -r requirements.txt

EXPOSE 8080

CMD ["python", "app.py"]