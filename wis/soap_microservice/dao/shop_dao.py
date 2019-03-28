import pymongo
import datetime

from model.User import User
from model.Purchase import Purchase


# Connecting MongoDB at port 27017
mongoClient = pymongo.MongoClient(port=27017)

# Get database instance
database = mongoClient.shop


# Get user from shop database by user_id
def get_user(user_id):
    user = database.user.find_one({'user_id': user_id})

    if user is not None:
        return User(user_id=user['user_id'], name=user['name'], address=user['address'])

    return user

# Get all user from shop database
def get_users():
    return [User(user_id=u['user_id'], name=u['name'], address=u['address']) for u in database.user.find()]


# Create purchase record into purchase collection in shop database
def purchase(product_id, user_id, quantity):
    product = database.product.find_one({'product_id': product_id})
    user = database.user.find_one({'user_id': user_id})

    if product is None or user is None:
        return False

    database.product.update_one({'product_id': product_id}, {'$set': {'quantity': product['quantity'] - quantity}})

    database.purchase.insert_one({
        'product_id': product_id,
        'user_id': user_id,
        'quantity': quantity,
        'price': product['price'] * quantity,
        'date': datetime.datetime.now()
    })

    return True

# Get all purchase from shop database
def get_purchases():
    return [Purchase(p['product_id'], p['user_id'], p['quantity'], p['price'], p['date']) for p in database.purchase.find()]

# Get all purchase from shop database by product id and user id
def get_purchases_by_product_id_and_user_id(product_id, user_id):
    return [Purchase(p['product_id'], p['user_id'], p['quantity'], p['price'], p['date']) for p in database.purchase.find({'product_id': product_id, 'user_id': user_id})]

# Get all purchase from shop database by product id
def get_purchases_by_product_id(product_id):
    return [Purchase(p['product_id'], p['user_id'], p['quantity'], p['price'], p['date']) for p in database.purchase.find({'product_id': product_id})]

# Get all purchase from shop database by user id
def get_purchases_by_user_id(user_id):
    return [Purchase(p['product_id'], p['user_id'], p['quantity'], p['price'], p['date']) for p in database.purchase.find({'user_id': user_id})]
