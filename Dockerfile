
FROM python:3.12.3-slim

RUN apt-get update && \
    apt-get install -y build-essential cmake \
    python3-dev python3-pip python3-setuptools \
    libatlas-base-dev gfortran && \
    rm -rf /var/lib/apt/lists/*

RUN pip install pybind11

# Копируем файлы проекта в контейнер
WORKDIR /app
COPY . /app

RUN pip install build

RUN pip install numpy

RUN make all

RUN python3 -m build

RUN pip install dist/*.whl

# Проверяем
CMD ["python3", "-c", "import lpnorm_core; print('Package installed successfully!')"]
CMD ["python3", "experiments.py"]
