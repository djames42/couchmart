#!/bin/bash

# createUsers.sh - Create the six users with access only to their own collection

for user in "Austin Gonyou" \
		"Boyd Stowe" \
		"Chitra Madhwacharyula" \
		"Dan James" \
		"Kevin Young" \
		"Tony Duarte"; do
	username=$(echo "${user}" | sed "s/ ..*//" | tr '[A-Z]' '[a-z]')
	echo "Creating User \"${user}\" (${username})..."
	curl -sS -X  PUT -u Administrator:password \
		http://127.0.0.1:8091/settings/rbac/users/local/${username} \
		-d password=password \
		-d roles=data_reader[couchmart:orders:${username}],query_select[couchmart:orders:${username}]
done
