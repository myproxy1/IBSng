#!/bin/bash
service IBSng stop
service postgresql restart
su - postgres  << EOF
dropdb IBSng
dropuser ibs
createdb IBSng
createuser ibs -s
createlang plpgsql IBSng
logout
EOF
/./usr/local/IBSng/scripts/setup.py
service postgresql restart
service IBSng restart
