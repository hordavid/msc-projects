import argparse
import logging

from flask import Flask
from flask_restful import Api

from resource.ProductRestResource import GetProducts
from resource.ProductRestResource import CreateProduct
from resource.ProductRestResource import UpdateProduct
from resource.ProductRestResource import GetProductById
from resource.ProductRestResource import DeleteProductById


def parse_args():
    parser = argparse.ArgumentParser(description='Script to parse REST Microservice command line arguments')
    parser.add_argument('-H', '--host',
                        help='Host ip address',
                        default='localhost')
    parser.add_argument('-p', '--port',
                        help='Port of the web server',
                        default='3003')

    return parser.parse_args()


server = Flask(__name__)
rest_api = Api(server)


rest_api.add_resource(GetProducts, '/shop/product/list')
rest_api.add_resource(CreateProduct, '/shop/product/create')
rest_api.add_resource(UpdateProduct, '/shop/product/update')
rest_api.add_resource(GetProductById, '/shop/product/get/<int:product_id>')
rest_api.add_resource(DeleteProductById, '/shop/product/delete/<int:product_id>')


if __name__ == '__main__':
    try:
        args = parse_args()
        logging.basicConfig(level=logging.INFO)

        server.run(host=args.host, port=int(args.port), debug=True)
    except KeyboardInterrupt as interrupt:
        logging.error('REST Microservice shutdown forced.')
    except Exception as e:
        logging.error('Fatal error! {}'.format(str(e)))