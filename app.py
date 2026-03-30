import os


# TWO blank lines here
def greet(name="World"):
    return f"Hello, {name}!"


# TWO blank lines here
def add(a, b):
    return a + b


# TWO blank lines here
def get_version():
    return os.getenv("APP_VERSION", "1.0.0")


if __name__ == "__main__":
    print(greet())
