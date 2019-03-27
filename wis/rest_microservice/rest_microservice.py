import logging

from flask import Flask
from flask_restful import Api

from resource.ProductRestResource import GetProducts
from resource.ProductRestResource import GetProductById
from resource.ProductRestResource import DeleteProductById


HOST = 'localhost'
PORT = 3003

server = Flask(__name__)
rest_api = Api(server)


rest_api.add_resource(GetProducts, '/shop/product/list')
rest_api.add_resource(GetProductById, '/shop/product/get/<int:product_id>')
rest_api.add_resource(DeleteProductById, '/shop/product/delete/<int:product_id>')


if __name__ == '__main__':
    logging.basicConfig(level=logging.INFO)

    server.run(host=HOST, port= PORT, debug=True)