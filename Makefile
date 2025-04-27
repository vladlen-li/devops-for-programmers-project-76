include .env
export $(shell sed 's/=.*//' .env)

prepare_env:
	./checks.sh
ansible-dependencies:
	ansible-galaxy install -r requirements.yml

ansible-deploy:
	ansible-playbook -i inventory.ini playbook.yml

ansible-destroy:
	ansible-playbook -i inventory.ini playbook-destroy.yml

start: prepare_env ansible-dependencies ansible-deploy
