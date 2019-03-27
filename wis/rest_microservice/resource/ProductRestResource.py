from flask_restful import Resource
from bson.json_util import dumps

from dao import shop_dao


class GetProducts(Resource):

    def get(self):
        return dumps(shop_dao.get_products())


class GetProductById(Resource):

    def get(self, product_id):
        return dumps(shop_dao.get_product(product_id=product_id))


class DeleteProductById(Resource):

    def get(self, product_id):
        shop_dao.delete_product(product_id=product_id)
        return '', 200
