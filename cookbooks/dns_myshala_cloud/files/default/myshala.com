$TTL 2D
@       IN  SOA  server.myshala.com. root.myshala.com. (
                                        0       ; serial
                                        1D      ; refresh
                                        1H      ; retry
                                        1W      ; expire
                                        3H )    ; minimum

@               IN      NS      myshala.com.
@               IN      A       192.168.100.251
server         IN       A      192.168.100.251
