import json
import random
import argparse
import requests
import logging

from zeep import Client


def parse_args():
    parser = argparse.ArgumentParser(description='Script to parse SOA Client command line arguments')
    parser.add_argument('-W', '--wsdl',
                        help='Wsdl url',
                        default='http://localhost:3000/?wsdl')
    parser.add_argument('-H', '--host',
                        help='REST Microservice ip address',
                        default='localhost')
    parser.add_argument('-p', '--port',
                        help='Port of the REST web server',
                        default='3003')

    return parser.parse_args()


def rest_get_products(url):
    logging.info("Get products from shop database")
    response = requests.get('{}/shop/product/list'.format(url))
    logging.info('Get products response: {}'.format(response.text))

def rest_create_product(url):
    data = {'name': 'New product', 'description': 'New description', 'quantity': 131, 'price': 111.5}
    logging.info("Create product into shop database with data={}".format(data))
    response = requests.post('{}/shop/product/create'.format(url), data=json.dumps(data))
    logging.info('Create product response: {}, status code: {}'.format(response.text, response.status_code))

def rest_get_product(url):
    logging.info("Get product by new id 21 from shop database")
    response = requests.get('{}/shop/product/get/21'.format(url))
    logging.info('Get product response: {}'.format(response.text))

def rest_delete_product(url):
    logging.info("Delete product by new id 21 from shop database")
    response = requests.get('{}/shop/product/delete/21'.format(url))
    logging.info('Delete product response: {}'.format(response.text))

def test_rest_microservice(host, port):
    url = 'http://{}:{}'.format(host, int(port))
    rest_get_products(url=url)
    rest_create_product(url=url)
    rest_get_product(url=url)
    rest_delete_product(url)


def test_soap_microservice(wsdl_url):
    client = Client(wsdl_url)

    logging.info("Get users from shop database")
    users = client.service.get_users()
    logging.info('Get users response: {}'.format(users))

    logging.info('Generate purchase of all user')
    for user in users:
        random_product_id = random.randint(1, 10)
        client.service.purchase(product_id=random_product_id, user_id=user['user_id'], quantity=random.randint(1, 15))

    logging.info("Get Purchases from shop database")
    purchases = client.service.get_purchases()
    logging.info('Get Purchases response: {}'.format(purchases))

def main():
    logging.info('SOA Client running...')

    args = parse_args()

    logging.info('Test REST Microservice start...')
    test_rest_microservice(host=args.host, port=args.port)
    logging.info('Test REST Microservice success')
    logging.info('\n\n')
    logging.info('Test SOAP Microservice start...')
    test_soap_microservice(wsdl_url=args.wsdl)
    logging.info('Test SOAP Microservice success')


if __name__ == '__main__':
    logging.basicConfig(level=logging.INFO)
    main()