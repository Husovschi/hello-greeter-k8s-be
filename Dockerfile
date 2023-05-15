FROM python:alpine3.18

COPY requirements.txt .
RUN pip install --no-cache-dir --upgrade -r requirements.txt \
 && rm requirements.txt

COPY main.py .

CMD ["uvicorn", "main:app", "--host", "0.0.0.0"]