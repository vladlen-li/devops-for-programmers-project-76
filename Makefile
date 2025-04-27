include .env
export $(shell sed 's/=.*//' .env)

check_env:
	./checks.sh

ansible-dependencies:
	ansible-galaxy install -r requirements.yml

ansible-deploy:
	ansible-playbook -i inventory.ini playbook.yml --vault-password-file get_vault_key

ansible-destroy:
	ansible-playbook -i inventory.ini playbook-destroy.yml --vault-password-file get_vault_key

ansible-edit-secrets:
	ansible-vault edit group_vars/webservers/vault.yml --vault-password-file get_vault_key

start: check_env ansible-dependencies ansible-deploy

destroy: check_env ansible-destroy

edit-secrets: check_env ansible-edit-secrets
