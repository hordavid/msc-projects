import pymongo


# Connecting MongoDB at port 27017
mongoClient = pymongo.MongoClient(port=27017)

# Get database instance
database = mongoClient.shop


# Insert dummy users
database.user.insert([
    {
        'user_id': 13,
        'name': 'Frank Drebin',
        'address': '1201 W 2nd Street, Los Angeles, CA'
    },
    {
        'user_id': 666,
        'name': 'Ed Hocken',
        'address': '200 N Spring Street, Los Angeles, CA'
    },
    {
        'user_id': 69,
        'name': 'Nordberg',
        'address': '700 E Temple Street, Los Angeles, CA'
    }
])


# Insert dummy products
database.product.insert([
    {
        'product_id': 1,
        'name': 'Product name',
        'description': 'Product description',
        'price': 7.58,
        'quantity': 100
    }
])
