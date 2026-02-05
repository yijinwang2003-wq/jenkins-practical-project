from locust import HttpUser, task, between

class InventoryUser(HttpUser):
    wait_time = between(1, 2)

    @task
    def access_inventory(self):
        self.client.get("/inventory")