import logging

from spyne import Application
from spyne import rpc
from spyne import ServiceBase
from spyne import Long
from spyne import Integer
from spyne import Boolean
from spyne import Iterable
from spyne.protocol.http import HttpRpc
from spyne.protocol.soap import Soap11
from spyne.server.wsgi import WsgiApplication
from wsgiref.simple_server import make_server

from service import shop_service
from model.User import User


HOST = 'localhost'
PORT = 8000


class SoapWebService(ServiceBase):

    @rpc(Long, _returns=User)
    def get_user(self, user_id):
        return shop_service.get_user(user_id=user_id)

    @rpc(_returns=Iterable(User))
    def get_users(self):
        return shop_service.get_users()

    @rpc(Long, Long, Integer, _returns=Boolean)
    def purchase(self, product_id, user_id, quantity):
        return shop_service.purchase(product_id=product_id, user_id=user_id, quantity=quantity)


soap_web_service_app = Application([SoapWebService],
                                   tns='simple.shop.soap.microservice',
                                   in_protocol=HttpRpc(validator='soft'),
                                   out_protocol=Soap11()
                                   )


if __name__ == '__main__':
    logging.basicConfig(level=logging.INFO)
    service = WsgiApplication(soap_web_service_app)

    server = make_server(host=HOST, port=PORT, app=service)
    print('Soap Microservice running at port {}'.format(PORT))

    server.serve_forever()
