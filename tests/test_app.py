import pytest
import sys
import os
sys.path.insert(0, os.path.dirname(os.path.dirname(__file__)))
from app import greet, add, get_version

def test_greet_default():
    assert greet() == "Hello, World!"

def test_greet_custom():
    assert greet("TeamCity") == "Hello, TeamCity!"

def test_add():
    assert add(2, 3) == 5
    assert add(-1, 1) == 0

def test_version():
    version = get_version()
    assert version is not None
    assert len(version) > 0
