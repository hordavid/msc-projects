import logging

from spyne import Application
from spyne.protocol.http import HttpRpc
from spyne.protocol.soap import Soap11
from spyne.server.wsgi import WsgiApplication
from wsgiref.simple_server import make_server

from web_service.ShopSoapWebService import ShopSoapWebService


HOST = 'localhost'
PORT = 3000
TARGET_NAMESPACE = 'simple.shop.soap.microservice'


soap_ws_app = Application(
    [ShopSoapWebService],
    tns=TARGET_NAMESPACE,
    in_protocol=HttpRpc(validator='soft'),
    out_protocol=Soap11()
)


if __name__ == '__main__':
    logging.basicConfig(level=logging.INFO)
    service = WsgiApplication(soap_ws_app)

    server = make_server(host=HOST, port=PORT, app=service)
    print('Soap Microservice running at port {}'.format(PORT))

    server.serve_forever()
