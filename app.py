# Simple Python web app for TeamCity demo
import os

def greet(name="World"):
    return f"Hello, {name}!"

def add(a, b):
    return a + b

def get_version():
    return os.getenv("APP_VERSION", "1.0.0")

if __name__ == "__main__":
    print(greet())
    print(f"Version: {get_version()}")
    print(f"2 + 3 = {add(2, 3)}")
