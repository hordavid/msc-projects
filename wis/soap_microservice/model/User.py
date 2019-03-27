from spyne import ComplexModel
from spyne import Long
from spyne import Unicode


class User(ComplexModel):
    user_id = Long
    name = Unicode
    address = Unicode

    def __init__(self, user_id, name, address):
        super(User, self).__init__()

        self.user_id = user_id
        self.name = name
        self.address = address
