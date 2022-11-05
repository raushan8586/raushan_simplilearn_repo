package test;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;

public class FirstTestCase {

	public static void main(String[] args) {
		
		
		System.setProperty("webdriver.chrome.driver", "D:\\Selenium_Simplilearn\\chromedriver.exe");
		WebDriver driver = new ChromeDriver();
		
		driver.navigate().to("https://login.yahoo.com/");
		
		driver.findElement(By.xpath("//input[@id='login-username']")).sendKeys("abc@yahoo.com");
		
		driver.findElement(By.xpath("//input[@id='login-signin']")).click();
		
		driver.close();
		

	}

}
