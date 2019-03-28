import logging
import argparse

from spyne import Application
from spyne.protocol.http import HttpRpc
from spyne.protocol.soap import Soap11
from spyne.server.wsgi import WsgiApplication
from wsgiref.simple_server import make_server

from web_service.ShopSoapWebService import ShopSoapWebService


def parse_args():
    parser = argparse.ArgumentParser(description='Script to parse SOAP Microservice command line arguments')
    parser.add_argument('-H', '--host',
                        help='Host ip address',
                        default='localhost')
    parser.add_argument('-p', '--port',
                        help='Port of the web server',
                        default='3000')

    return parser.parse_args()


soap_ws_app = Application(
    [ShopSoapWebService],
    tns='simple.shop.soap.microservice',
    in_protocol=Soap11(validator='soft'),
    out_protocol=Soap11()
)


if __name__ == '__main__':
    try:
        args = parse_args()
        logging.basicConfig(level=logging.INFO)

        service = WsgiApplication(soap_ws_app)

        server = make_server(host=args.host, port=int(args.port), app=service)
        logging.info('SOAP Microservice running at port {}'.format(args.port))

        server.serve_forever()
    except KeyboardInterrupt as interrupt:
        logging.error('SOAP Microservice shutdown forced.')
    except Exception as e:
        logging.error('Fatal error! {}'.format(str(e)))