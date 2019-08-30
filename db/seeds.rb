user = User.create(email: 'user@email.com', password: '12345678');
coop = Cooperative.create(email: 'coop@email.com', password: '12345678');
garbage_man = GarbageMan.create( name: 'Lucas', address: 'Rua ibituruna', contact: '1198899888', withdrawal: 'Caminhão', cooperative: coop)
garbage_man1 = GarbageMan.create( name: 'Josy', address: 'Rua napoleao de barros', contact: '1198899888', withdrawal: 'Caminhão', cooperative: coop)
garbage_man2 = GarbageMan.create( name: 'Josy', address: 'Rua ibituruna', contact: '1198899888', withdrawal: 'Caminhão', cooperative: coop)


removal_order1 = RemovalOrder.create(weight: 10,
                                     removal_date_start: '01/09/2000',
                                     removal_date_end: '02/09/2000',
                                     address: 'rua das figueiras',
                                     description: 'Material feito de ferro',
                                     garbage_man: garbage_man,
                                     user: user, status: :open)

removal_order2 = RemovalOrder.create(weight: 29,
                                     removal_date_start: '06/09/2000',
                                     removal_date_end: '08/09/2000',
                                     address: 'Rua Borges Lagoa',
                                     description: 'Material feito de plastico',
                                     garbage_man: garbage_man1,
                                     user: user, status: :open)

removal_order3 = RemovalOrder.create(weight: 39,
                                     removal_date_start: '06/09/2000',
                                     removal_date_end: '08/09/2000',
                                     address: 'Rua Ipiranga',
                                     description: 'Material feito de papel',
                                     garbage_man: garbage_man1,
                                     user: user, status: :close)

                                     
                                     
removal_order4 = RemovalOrder.create(weight: 919,
                                      removal_date_start: '06/09/2000',
                                      removal_date_end: '08/09/2000',
                                      address: 'Rua Margarida',
                                      description: 'Lata de tinta',
                                      user: user, status: :open)   

