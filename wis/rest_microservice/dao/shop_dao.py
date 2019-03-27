import random
import pymongo


# Connecting MongoDB at port 27017
mongoClient = pymongo.MongoClient(port=27017)

# Get database instance
database = mongoClient.shop


# Generate id of new product
def get_new_product_id():
    return random.randint(20, 10000000)

# Get product from shop database by product id
def get_product(product_id):
    return database.product.find_one({'product_id': product_id})

# Get all product from shop database
def get_products():
    return database.product.find()

# Create new product record into shop database
def create_product(name, description, quantity, price):
    database.product.insert_one({
        'product_id': get_new_product_id(),
        'name': name,
        'description': description,
        'price': price,
        'quantity': quantity
    })

# Add some product to shop database by product id
#def add_products(product_id, quantity):
#    database.product.update_one({'product_id': product_id}, {'$inc': {'quantity': quantity}})

# Update one specified product in shop database by product_id
def update_product(product_id, name, description, quantity, price):
    database.product.update_one({'product_id': product_id}, {'name':name, 'description': description, 'quantity': quantity, 'price': price})

# Delete product in shop database by product id
def delete_product(product_id):
    database.product.delete_one({'product_id': product_id})

