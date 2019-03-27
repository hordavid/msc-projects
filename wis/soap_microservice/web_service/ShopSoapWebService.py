from spyne import rpc
from spyne import ServiceBase
from spyne import Long
from spyne import Integer
from spyne import Boolean
from spyne import Iterable

from dao import shop_dao
from model.User import User
from model.Purchase import Purchase


class ShopSoapWebService(ServiceBase):

    @rpc(Long, _returns=User)
    def get_user(self, user_id):
        return shop_dao.get_user(user_id=user_id)

    @rpc(_returns=Iterable(User))
    def get_users(self):
        return shop_dao.get_users()

    @rpc(Long, Long, Integer, _returns=Boolean)
    def purchase(self, product_id, user_id, quantity):
        return shop_dao.purchase(product_id=product_id, user_id=user_id, quantity=quantity)

    @rpc(_returns=Iterable(Purchase))
    def get_purchases(self):
        return shop_dao.get_purchases()

    @rpc(Long, Long, _returns=Iterable(Purchase))
    def get_purchases_by_product_id_and_user_id(self, product_id, user_id):
        return shop_dao.get_purchases_by_product_id_and_user_id(product_id=product_id, user_id=user_id)

    @rpc(Long, _returns=Iterable(Purchase))
    def get_purchases_by_product_id(self, product_id):
        return shop_dao.get_purchases_by_product_id(product_id=product_id)

    @rpc(Long, _returns=Iterable(Purchase))
    def get_purchases_by_user_id(self, user_id):
        return shop_dao.get_purchases_by_user_id(user_id=user_id)