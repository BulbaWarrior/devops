import main
from datetime import datetime
import pytest

@pytest.fixture
def time_resource():
    resource = main.TimeResource()
    return resource


def test_same_minute(time_resource):
    minute = datetime.now().strftime("%M")
    returned_minute = time_resource.get_time_string().split(":")[1]
    assert minute == returned_minute # minutes should be equal in every timezone

def test_same_second(time_resource):
    second = datetime.now().strftime("%S")
    returned_second = time_resource.get_time_string().split(":")[2]
    assert second == returned_second # minutes should be equal in every timezone
