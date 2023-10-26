/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package selenium;

import org.junit.Before;
import org.junit.Test;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;

/**
 *
 * @author MY LAPTOP
 */
public class OrderList {

    private WebDriver driver;

    public void setup() {
        System.setProperty("webdriver.chrome.driver", "D:\\App\\chromedriver-win64\\chromedriver-win64\\chromedriver.exe");
        ChromeOptions options = new ChromeOptions();
//        options.addArguments("--remote-allow-origin=*");
        driver = new ChromeDriver(options);
    }

    public void login() {
        // Điền dữ liệu vào trường phone
        driver.findElement(By.name("phone")).sendKeys("0123456789");

        // Điền dữ liệu vào trường password
        driver.findElement(By.name("password")).sendKeys("password1");

        // Ấn nút Login
        driver.findElement(By.name("btnLogin")).click();
    }

    @Test
    public void testSearchByDate() {
        setup();
        driver.get("http://localhost:8080/");
        driver.manage().window().maximize(); // Mở cửa sổ trình duyệt ở chế độ toàn màn hình

        login();
        driver.findElement(By.name("startDate")).sendKeys("10/12/2023");
        driver.findElement(By.name("endDate")).sendKeys("10/12/2023");

        // Ấn nút tìm kiếm
        driver.findElement(By.cssSelector("button[name='btnSearch']")).click();
    }

    @Test
    public void testSearchByOrderId() {
        setup();
        driver.get("http://localhost:8080/");
        driver.manage().window().maximize(); // Mở cửa sổ trình duyệt ở chế độ toàn màn hình
        // Điền dữ liệu vào trường phone
        login();
        driver.findElement(By.name("orderId")).sendKeys("ORD0000002");
        driver.findElement(By.xpath("//button[text()='Search']")).click();
    }
    
    @Test
    public void testViewOrderDetail() {
        setup();
        driver.get("http://localhost:8080/");
        driver.manage().window().maximize(); // Mở cửa sổ trình duyệt ở chế độ toàn màn hình
        // Điền dữ liệu vào trường phone
        login();
        driver.findElement(By.id("btnView")).click();
    }
    
    @Test
    public void testViewCustomerInformation() {
        setup();
        driver.get("http://localhost:8080/");
        driver.manage().window().maximize(); // Mở cửa sổ trình duyệt ở chế độ toàn màn hình
        // Điền dữ liệu vào trường phone
        login();
        driver.findElement(By.id("btnView")).click();
        driver.findElement(By.id("more")).click();
    }
//    @After
    public void teardown() {
        driver.quit();
    }
}
