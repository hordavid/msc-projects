from spyne import ComplexModel
from spyne import Long
from spyne import Integer
from spyne import DateTime


class Purchase(ComplexModel):
    product_id = Long
    user_id = Long
    quantity = Integer
    price = Long
    date = DateTime

    def __init__(self, product_id, user_id, quantity, price, date):
        super(Purchase, self).__init__()

        self.product_id = product_id
        self.user_id = user_id
        self.quantity = quantity
        self.price = price
        self.date = date
