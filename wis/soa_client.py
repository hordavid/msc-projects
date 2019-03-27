import requests as req
import logging


def test_soap_microservice():
    pass


def test_rest_microservice():
    pass


def main():
    logging.info('SOA Client running...')

    logging.info('Test SOAP Microservice start...')
    test_soap_microservice()

    logging.info('Test REST Microservice start...')
    test_rest_microservice()

if __name__ == '__main__':
    logging.basicConfig(level=logging.INFO)
    main()