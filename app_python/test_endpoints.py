import main
import pytest
from falcon import testing

@pytest.fixture
def client():
    return testing.TestClient(main.create())

def test_get_root(client):
    result = client.simulate_get("/")
    assert result.status_code == 200

def test_get_not_found(client):
    result = client.simulate_get("/gljasdldfadlhfblajfal")
    assert result.status_code == 404
