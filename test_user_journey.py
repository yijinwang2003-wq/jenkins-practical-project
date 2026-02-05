import pytest
from playwright.sync_api import sync_playwright

def test_inventory_journey():
    with sync_playwright() as p:
        browser = p.chromium.launch(headless=False) 
        page = browser.new_page()

        target_url = "http://localhost:5001/inventory"
        print(f"\nNavigating to: {target_url}")
        
        page.goto(target_url)

        page.wait_for_timeout(2000) 

        inventory_content = page.content()
        print(f"Page Content Snippet: {inventory_content[:200]}") 

        assert "Office Chair" in inventory_content

        page.screenshot(path="e2e_debug_evidence.png")
        print("E2E Test Passed!")
        
        browser.close()

if __name__ == "__main__":
    test_inventory_journey()