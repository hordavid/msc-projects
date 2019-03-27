import logging
import pymongo


# Set up logger
logging.basicConfig(level=logging.INFO)

# Connecting MongoDB at port 27017
mongoClient = pymongo.MongoClient(port=27017)

# Get database instance
database = mongoClient.shop


# Insert dummy users
logging.info('Insert dummy users into shop database...')
database.user.insert([
    {
        'user_id': 13,
        'name': 'Frank Drebin',
        'address': '1201 W 2nd Street, Los Angeles, CA'
    },
    {
        'user_id': 1,
        'name': 'Ed Hocken',
        'address': '200 N Spring Street, Los Angeles, CA'
    },
    {
        'user_id': 69,
        'name': 'Nordberg',
        'address': '700 E Temple Street, Los Angeles, CA'
    }
])
logging.info('Insert dummy users into shop database success.')


# Insert dummy products
logging.info('Insert dummy products into shop database...')
database.product.insert([
    {
        'product_id': 1,
        'name': 'Book',
        'description': 'Product description 1',
        'price': 7.58,
        'quantity': 100
    },
    {
        'product_id': 2,
        'name': 'Action figure',
        'description': 'Product description 2',
        'price': 12.4,
        'quantity': 45
    },
    {
        'product_id': 3,
        'name': 'CD',
        'description': 'Product description 3',
        'price': 31.8,
        'quantity': 100
    },
    {
        'product_id': 4,
        'name': 'Chocolate',
        'description': 'Product description 4',
        'price': 9.45,
        'quantity': 34
    },
    {
        'product_id': 5,
        'name': 'Bicycle',
        'description': 'Product description 5',
        'price': 180.5,
        'quantity': 5
    },
    {
        'product_id': 6,
        'name': 'Lollypop',
        'description': 'Product description 6',
        'price': 1.25,
        'quantity': 1000
    },
    {
        'product_id': 7,
        'name': 'T-Shirt',
        'description': 'Product description 7',
        'price': 55.6,
        'quantity': 67
    },
    {
        'product_id': 8,
        'name': 'Coffee mug',
        'description': 'Product description 8',
        'price': 23.0,
        'quantity': 7
    },
    {
        'product_id': 9,
        'name': 'Jeans',
        'description': 'Product description 9',
        'price': 48.6,
        'quantity': 238
    },{
        'product_id': 10,
        'name': 'VR Headset',
        'description': 'Product description 10',
        'price': 85.4,
        'quantity': 59
    }
])
logging.info('Insert dummy products into shop database success.')
