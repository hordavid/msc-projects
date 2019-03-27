import pymongo
import datetime

from model.User import User


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

# Get all user from database
def get_users():
    return [User(user_id=u['user_id'], name=u['name'], address=u['address']) for u in database.user.find()]


# Create purchase record into purchases
def purchase(product_id, user_id, quantity):
    product = database.product.find_one({'product_id': product_id})
    user = database.user.find_one({'user_id': user_id})

    if product is None or user is None:
        return False

    database.purchase.insert_one({
        'product_id': product_id,
        'user_id': user_id,
        'quantity': quantity,
        'price': product['price'] * quantity,
        'date': datetime.datetime.now()
    })

    return True
