from setuptools import setup, Extension
import pybind11

# Получение пути к заголовочным файлам pybind11
include_dirs = [pybind11.get_include()]

# Определение расширения
lpnorm_module = Extension(
    "lpnorm",               # Имя модуля
    sources=["Lpnorm.cpp"],      # Исходный файл
    include_dirs=include_dirs,   # Заголовочные файлы pybind11
    language="c++",              # Язык программирования
    extra_compile_args=['-std=c++11', '-O3', '-march=native', '-Wall'],  # Флаги компиляции
    extra_link_args=['-shared', '-fPIC']  # Флаги линковки
)

# Конфигурация пакета
setup(
    name="lpnorm",
    version="0.1",
    description="My packeg for Lp-norm function",
    ext_modules=[lpnorm_module],  # Подключаем C++ расширение
    zip_safe=False,
)
