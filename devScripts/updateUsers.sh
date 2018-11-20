## Truncate digest users and logins. Then add new users

psql aide -U postgres -c "DROP SCHEMA digest CASCADE;"
sh /opt/kerbproxy/setup/digest/updateDb.sh

sh /opt/kerbproxy/setup/digest/bootstrap.sh -u abby -p Abby
sh /opt/kerbproxy/setup/digest/bootstrap.sh -u user -p name
sh /opt/kerbproxy/setup/digest/bootstrap.sh -u testing -p 1234


sh /opt/kerbproxy/setup/digest/reset_password.sh -u abby -p Abby
sh /opt/kerbproxy/setup/digest/reset_password.sh -u user -p name
sh /opt/kerbproxy/setup/digest/reset_password.sh -u testing -p 1234

