include .env
export $(shell sed 's/=.*//' .env)

make_checks:
	./checks.sh
dependencies:
	ansible-galaxy install -r requirements.yml

prepare:
	ansible-playbook -i inventory.ini playbook.yml

start: make_checks dependencies prepare
