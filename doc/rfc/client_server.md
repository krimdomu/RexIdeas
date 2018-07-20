# Client / Server model

The idea is, that the communication is done over ssh but with a rex process attached on the remote side. (like rsync over ssh). 
The server on the remote side will be uploaded from rex right after a successfull connection. This allows us to optimize the protocol to our needs.

