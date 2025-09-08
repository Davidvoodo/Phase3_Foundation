from app import app

def test_health():
    client = app.test_client()
    response = client.get("/health")
    assert response.status_code == 200
    assert response.json["status"] == "ok"

def test_version():
    client = app.test_client()
    response = client.get("/version")
    assert response.status_code == 200
    assert "version" in response.json
