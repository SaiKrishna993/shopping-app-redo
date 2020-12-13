# E-commerce Store App

This e-commerce website having following features

 
When a shop logs in, he should be able to do the following actions
1. List products of the shop
2. Add Products
3. Edit Product
4. View Product
5. Remove product
6. View orders
7. Cancel Order. Send mail to shop and customer
 
 When Customer logs in,
 
1. List all shops
2. List all products in a shop
3. Create an order from a shop. [Note: Restrict user to select products from different shops in order. One order should not contain products from multiple shops.]
4. Once the order is created, send mail to shop and customer
5. User should be able to list all his orders
6. Cancel the order. Send mail to shop and customer
7. View Existing Order

### Prerequisites

* Ruby 2.4.1
* Rails 5.1.4
* Redis
* Mailcatcher

### Installing

Clone this repository
```
git clone 
```

Install required gems
```
bundle install
```

Create and configure the database
```
rake db:create db:migrate
```

Start the application
* Open mailcatcher in one tab and run application in another tab
```
gem install mailcatcher
mailcatcher i.e: http://localhost:1080/
rails s i.e: http://localhost:3000/
```

__Note:__ This app requires Redis to run (for the cart component). I found this guide useful in installing my local copy of redis: 
[Guide for Installing Redis](https://www.linuxhelp.com/how-to-install-redis-server-on-ubuntu-17-04/)

